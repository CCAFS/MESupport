<?php
use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;

$app->add(function ($req, $res, $next) {
    $response = $next($req, $res);
    return $response
            ->withHeader('Access-Control-Allow-Origin', '*')
            ->withHeader('Access-Control-Allow-Headers', 'X-Requested-With, Content-Type, Accept, Origin, Authorization')
            ->withHeader('Access-Control-Allow-Methods', 'GET, POST, PUT, DELETE, OPTIONS');
            //->withHeader('Content-Type', 'application/json');
});

// Get Single person by email
$app->get('/api/getPersonInfo/{email}', function(Request $request, Response $response){
    // Set JSON Header
    $response->withHeader('Content-Type', 'application/json');

    $email = $request->getAttribute('email');

    $sql = "SELECT
            -- Person
            dp.id, dp.first_name, dp.last_name, dp.registered, dp.email,
            -- Download
            dd.institute, dd.date
            FROM
            mesp_person dp,
            mesp_download dd
            WHERE
            -- Person Filter
            dp.email = '$email'
            AND dp.id = dd.user_id
            ORDER BY dd.id DESC limit 1;
    ";

    try{
        // Get DB Object
        $db = new db();
        // Connect
        $db = $db->connect();
        $stmt = $db->query($sql);
        $person = $stmt->fetch(PDO::FETCH_OBJ);
        $db = null;
        echo json_encode($person);
    } catch(PDOException $e){
        echo '{"error": {"text": '.$e->getMessage().'}';
    }
});

// Set download
$app->post('/api/setDownload', function(Request $request, Response $response){
    // Set JSON Header
    $response->withHeader('Content-Type', 'application/json');

    $data = $request->getParsedBody();
    // Messages
    $messages = array();
    // Data
    $userId = $data['userId'];
    $first_name = $data['firstName'];
    $last_name =  $data['lastName'];
    $email = $data['email'];
    $instituteName = $data['instituteName'];
    $use = $data['use'];
    $guideSelected = $data['guideSelected'];
    $instituteRegions = $data['instituteRegions'];
    $researchRegions = $data['researchRegions'];

    // Set userId if does not exists
    if($userId == ""){
        if(($first_name != "") && ($last_name != "") && ($email != "")){
            $sql = "INSERT INTO mesp_person (first_name,last_name,email)
                    VALUES (:first_name,:last_name,:email)";
            try{
                // Get DB Object
                $db = new db();
                // Connect
                $db = $db->connect();
                $stmt = $db->prepare($sql);
                $stmt->bindParam(':first_name', $first_name);
                $stmt->bindParam(':last_name',  $last_name);
                $stmt->bindParam(':email',      $email);
                $stmt->execute();

                // Geting the new user ID
                $sql = "SELECT * FROM mesp_person WHERE email = '$email'";
                $stmt = $db->query($sql);
                $person = $stmt->fetch(PDO::FETCH_OBJ);
                $db = null;
                $userId = $person->id;


                array_push($messages, "Person ID=".$userId." was added successfully");

            } catch(PDOException $e){
                array_push($messages, "PDOException: ".$e->getMessage() );
            }
        }else{
            array_push($messages, "Invalid person information");
        }
    }else{
        array_push($messages, "Person ID=".$userId." already exists in the DB");
    }

    // Set Download
    $sql = "INSERT INTO mesp_download (user_id, institute, intended_use )
            VALUES (:user_id,:institute,:intended_use)";
    try{
        // Get DB Object
        $db = new db();
        // Connect
        $db = $db->connect();
        $stmt = $db->prepare($sql);
        $stmt->bindParam(':user_id',        $userId);
        $stmt->bindParam(':institute',      $instituteName);
        $stmt->bindParam(':intended_use',   $use);
        $stmt->execute();

        // Geting the last download
        $sql = "SELECT * FROM mesp_download WHERE user_id = '$userId' ORDER BY date DESC";
        $stmt = $db->query($sql);
        $download = $stmt->fetch(PDO::FETCH_OBJ);
        $downloadId = $download->id;
        //$db = null;

        array_push($messages, "Download ID=".$downloadId." was added successfully");

    } catch(PDOException $e){
        array_push($messages, "PDOException: ".$e->getMessage() );
    }

    // Set Guidelines downloaded
    foreach ($guideSelected as $guideId) {
        $sql = "INSERT INTO mesp_download_guidelines (download_id, guideline_id)
                VALUES (:download_id, :guideline_id)";
        try{
            // Get DB Object
            $db = new db();
            // Connect
            $db = $db->connect();
            $stmt = $db->prepare($sql);
            $stmt->bindParam(':download_id',    $downloadId);
            $stmt->bindParam(':guideline_id',   $guideId);
            $stmt->execute();

            array_push($messages, "Guideline ID downloaded=".$guideId );

        } catch(PDOException $e){
            array_push($messages, "PDOException: ".$e->getMessage() );
        }
    }

    // Set region(s) where your institute is located download
    foreach ($instituteRegions as $regionId) {
        $sql = "INSERT INTO mesp_download_regions (download_id, region_id, region_scope)
                VALUES (:download_id, :region_id, 'instituteRegion')";
        try{
            // Get DB Object
            $db = new db();
            // Connect
            $db = $db->connect();
            $stmt = $db->prepare($sql);
            $stmt->bindParam(':download_id',    $downloadId);
            $stmt->bindParam(':region_id',   $regionId);
            $stmt->execute();

            array_push($messages, "Located Region ID downloaded=".$regionId );

        } catch(PDOException $e){
            array_push($messages, "PDOException: ".$e->getMessage() );
        }
    }

    // Set region(s) of your research interest download
    foreach ($researchRegions as $regionId) {
        $sql = "INSERT INTO mesp_download_regions (download_id, region_id, region_scope)
                VALUES (:download_id, :region_id, 'researchRegion')";
        try{
            // Get DB Object
            $db = new db();
            // Connect
            $db = $db->connect();
            $stmt = $db->prepare($sql);
            $stmt->bindParam(':download_id',    $downloadId);
            $stmt->bindParam(':region_id',   $regionId);
            $stmt->execute();

            array_push($messages, "Research Region ID downloaded=".$regionId );

        } catch(PDOException $e){
            array_push($messages, "PDOException: ".$e->getMessage() );
        }
    }


    echo json_encode($messages);

});