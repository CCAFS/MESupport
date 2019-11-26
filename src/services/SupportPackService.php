<?php
namespace services;
use PDO;

class SupportPackService {


  public function __construct(){


  }

  // Get Categories
  public function getGuidelines(){
    return $this->getQueryFetchAll("SELECT * FROM  mesp_guidelines ORDER BY code");
  }

  // Get Guideline Levels
  public function getGuidelinesByRoleStageCategory($role, $stage, $category){
    $sqlQuery = 'SELECT
              	g.id,
                g.`code`,
                (REPLACE(g.`code`, ".", "")) as "composedCode",
	              g.`name`,
              	g.type,
              	TRIM(g.source) AS "source",
              	il.importance_level as "level",
              	(
              		CASE il.importance_level
              		WHEN 4 THEN "Very Important"
              		WHEN 3 THEN "Important"
              		WHEN 2 THEN "Useful"
              		WHEN 1 THEN "Optional"
              		END
              	) AS "importance_level"
              FROM
              	mesp_importance_levels il
              INNER JOIN mesp_categories c ON il.category_id = c.id
              INNER JOIN mesp_stages s ON il.stage_id = s.id
              INNER JOIN mesp_roles r ON il.role_id = r.id
              INNER JOIN mesp_guidelines g ON il.guideline_id = g.id
              WHERE
              	il.role_id = '.$role.'
              AND il.stage_id = '.$stage.'
              AND il.category_id = '.$category.'
              AND g.active = 1
              ORDER BY
              	composedCode';
    return $this->getQueryFetchAll($sqlQuery);
  }

  public function getImportanceLevel($gId, $sId, $rId){
    $sqlQuery = 'SELECT
                	id_importance_level,
                	guideline_id,
                	category_id,
                	stage_id,
                	role_id,
                	importance_level as "level"
                	, (
                		CASE importance_level
                		WHEN 4 THEN "Very Important"
                		WHEN 3 THEN "Important"
                		WHEN 2 THEN "Useful"
                		WHEN 1 THEN "Optional"
                		END
                	) AS "importance_level"
                FROM
                	mesp_importance_levels
                WHERE
                	guideline_id = '.$gId.'
                AND stage_id = '.$sId.'
                AND role_id = '.$rId.';';
    return $this->getQueryFetch($sqlQuery);
  }

  // Get Categories
  public function getCategories(){
    return $this->getQueryFetchAll("SELECT * FROM mesp_categories");
  }

  // Get Regions
  public function getRegions(){
    return $this->getQueryFetchAll("SELECT * FROM mesp_regions");
  }

  // Get Stages
  public function getStages(){
    return $this->getQueryFetchAll("SELECT * FROM mesp_stages");
  }

  // Get Roles
  public function getRoles(){
    return $this->getQueryFetchAll("SELECT * FROM mesp_roles");
  }

  //Get Person information
  public function getPersonInfo($email){
    $sqlQuery = "SELECT
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
    return $this->getQueryFetch($sqlQuery);
  }

  // Create a new Person
  public function createPerson($first_name, $last_name, $email){
    $sqlQuery = "INSERT INTO mesp_person (first_name,last_name,email)
                  VALUES (:first_name,:last_name,:email)";
    try{
        // Get DB Object
        $db = new \db();
        // Connect
        $db = $db->connect();
        $stmt = $db->prepare($sqlQuery);
        $stmt->bindParam(':first_name', $first_name);
        $stmt->bindParam(':last_name',  $last_name);
        $stmt->bindParam(':email',      $email);
        $stmt->execute();

        // Geting the new user ID
        $sql = "SELECT * FROM mesp_person WHERE email = '$email'";
        $stmt = $db->query($sql);
        $person = $stmt->fetch(PDO::FETCH_OBJ);
        $db = null;
        return $person->id;
    } catch(PDOException $e){
        return false;
        echo '{"error": {"text": '.$e->getMessage().'}';
    }
  }

  // Set Download
  public function setDownload($userId, $instituteName, $use){
    $sqlQuery = "INSERT INTO mesp_download (user_id, institute, intended_use )
              VALUES (:user_id,:institute,:intended_use)";
    try{
        // Get DB Object
        $db = new \db();
        // Connect
        $db = $db->connect();
        $stmt = $db->prepare($sqlQuery);
        $stmt->bindParam(':user_id',        $userId);
        $stmt->bindParam(':institute',      $instituteName);
        $stmt->bindParam(':intended_use',   $use);
        $stmt->execute();

        // Geting the new user ID
        $sql = "SELECT * FROM mesp_download WHERE user_id = '$userId' ORDER BY date DESC";
        $stmt = $db->query($sql);
        $download = $stmt->fetch(PDO::FETCH_OBJ);
        $db = null;
        return $download->id;
    } catch(PDOException $e){
        return false;
        echo '{"error": {"text": '.$e->getMessage().'}';
    }
  }

  // Set Downloaded Guideline
  public function setDownloadedGuideline($downloadId, $guideId){
    $sqlQuery = "INSERT INTO mesp_download_guidelines (download_id, guideline_id)
                  VALUES (:download_id, :guideline_id)";
    try{
        // Get DB Object
        $db = new \db();
        // Connect
        $db = $db->connect();
        $stmt = $db->prepare($sqlQuery);
        $stmt->bindParam(':download_id',    $downloadId);
        $stmt->bindParam(':guideline_id',   $guideId);
        $stmt->execute();
        return true;
    } catch(PDOException $e){
        return false;
        echo '{"error": {"text": '.$e->getMessage().'}';
    }
  }

  // Set Downloaded Region
  public function setDownloadedRegion($downloadId, $regionId, $scope){
    $sqlQuery = "INSERT INTO mesp_download_regions (download_id, region_id, region_scope)
                  VALUES (:download_id, :region_id, :scope)";
    try{
        // Get DB Object
        $db = new \db();
        // Connect
        $db = $db->connect();
        $stmt = $db->prepare($sqlQuery);
        $stmt->bindParam(':download_id',    $downloadId);
        $stmt->bindParam(':region_id',   $regionId);
        $stmt->bindParam(':scope', $scope);
        $stmt->execute();
        return true;
    } catch(PDOException $e){
        return false;
        echo '{"error": {"text": '.$e->getMessage().'}';
    }
  }

  private function getQueryFetchAll($query){
    //global $settings;
    try{
        // Get DB Object
        $db = new \db();
        // Connect
        $db = $db->connect();
        // Get CRPs
        $stmt = $db->query($query);
        return $stmt->fetchAll(PDO::FETCH_OBJ);
        $db = null;
    } catch(PDOException $e){
        return '{"error": {"text": '.$e->getMessage().'}';
    }
  }

  private function getQueryFetch($query){
    //global $settings;
    try{
        // Get DB Object
        $db = new \db();
        // Connect
        $db = $db->connect();
        // Get CRPs
        $stmt = $db->query($query);
        return $stmt->fetch(PDO::FETCH_OBJ);
        $db = null;
    } catch(PDOException $e){
        echo '{"error": {"text": '.$e->getMessage().'}';
    }
  }


}

?>
