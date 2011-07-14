<?php
/*========================================================================================*\
	#	Coder    :  Ian Newton
	#	Date     :  26th May,2011
	#	Test version  
	#  Class File to handle DB stuff.
\*=========================================================================================*/

class Default_Model_DB_Class
 {
	private $mysqli;
	private $result;
	private $select='SELECT * FROM ';
	private $where=' WHERE ';
	private $limit=' LIMIT ';
	private $like=' LIKE ';
	
	/**  * Constructor  */
	public function Default_Model_DB_Class($dbLogin){
		
	// connect to MySQL and select database
		$this->mysqli=new mysqli($dbLogin['dbhost'], $dbLogin['dbusername'], $dbLogin['dbuserpass'], $dbLogin['dbname']);
		if(mysqli_connect_errno()){
			throw new Exception('Error connecting to MySQL: '.$this->mysqli->error);
		}
	}

	// run SQL query
	
	public function query($query){
	
		if(!$this->result=$this->mysqli->query($query)){
			throw new Exception('Error running SQL query: '.$this->mysqli->error);
		}
	
	}
	
	// fetch one row
	
	public function fetchRow(){
	
		while($row=$this->result->fetch_assoc()){
			return $row;
		}
		return false;
	}
	
	// fetch all rows
	
	public function fetchAll($table='default_table'){
	
		$this->query($this->select.$table);
		$rows=array();
		while($row=$this->fetchRow()){
			$rows[]=$row;
		}
		return $rows;
	}
	
	// insert row
	
	public function insert($params=array(),$table='default_table'){
	
		$sql="INSERT INTO ".$table." (".implode(',',array_keys($params)).") VALUES (".implode(',',array_values($params)).")";
		$this->query($sql);
	}
	
	// update row
	
	public function update($params=array(),$where,$table='default_table'){
	
		$args=array();
		foreach($params as $field=>$value){
			$args[]=$field."=".$value.'';
		}
		$sql='UPDATE '.$table.' SET '.implode(',',$args).' WHERE '.$where;
		$this->query($sql);
	}
	
	// delete one or multiple rows
	
	public function delete($where='',$table='default_table'){
	
		$sql=!$where?'DELETE FROM '.$table:'DELETE FROM '.$table.' WHERE '.$where;
		$this->query($sql);
	}
	
	// fetch rows using WHERE clause
	
	public function fetchWhere($where,$table='default_table'){
	
		$this->query($this->select.$table.$this->where.$where);
		$rows=array();
		while($row=$this->fetchRow()){
			$rows[]=$row;
		}
		return $rows;
	}
	
	// fetch rows using LIKE clause
	
	public function fetchLike($field,$like,$table='default_table'){
	
		$this->query($this->select.$table.$this->where.$field.$this->like.$like);
		$rows=array();
		while($row=$this->fetchRow()){
			$rows[]=$row;
		}
		return $rows;
	}
	
	// fetch rows using LIMIT clause
	
	public function fetchLimit($offset=1,$numrows=1,$table='default_table'){
	
		$this->query($this->select.$table.$this->limit.$offset.','.$numrows);
		$rows=array();
		while($row=$this->fetchRow()){
			$rows[]=$row;
		}
		return $rows;
	}

}
?>