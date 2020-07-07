<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Admin extends CI_Controller {
    public function index()
    {
        if (!isset($_SESSION['nombre'])){
            header('Location: '.base_url());
        }
        $this->load->view('templates/header');
        $this->load->view('admin');
        $this->load->view('templates/footer');
    }
    public function insert()
    {
        $ci=$_POST['ci'];
        $asunto=$_POST['asunto'];
        $nombre=$_POST['nombre'];
        $idusuario=$_SESSION['iduser'];
        $numero=$_POST['numero'];
        $this->db->query("INSERT INTO tramite SET 
ci='$ci',
asunto='$asunto',
nombre='$nombre',
idusuario='$idusuario',
numero='$numero'
");
        header('Location: '.base_url().'Admin');
    }
    public function datos($id){
        $query=$this->db->query("SELECT * FROM tramite WHERE idtramite='$id'");
        echo json_encode($query->result_array());
    }
    public function historia($id){
        $query=$this->db->query("SELECT h.fecha,t.nombre,h.lugar,h.estado,h.detalle 
FROM tramite t 
INNER JOIN historia h ON t.idtramite=h.idtramite 
WHERE h.idtramite=$id");
        echo json_encode($query->result_array());
    }
    public function hitoriainsert(){
        $idtramite=$_POST['idtramite'];
        $estado=$_POST['estado'];
        $lugar=$_POST['lugar'];
        $iduser=$_SESSION['iduser'];
        $detalle=$_POST['detalle'];
        $this->db->query("INSERT INTO historia SET 
idtramite='$idtramite',
estado='$estado',
lugar='$lugar',
iduser='$iduser',
detalle='$detalle'
");
//        echo 1;
    }
}
