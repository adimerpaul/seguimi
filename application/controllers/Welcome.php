<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Welcome extends CI_Controller {

	/**
	 * Index Page for this controller.
	 *
	 * Maps to the following URL
	 * 		http://example.com/index.php/welcome
	 *	- or -
	 * 		http://example.com/index.php/welcome/index
	 *	- or -
	 * Since this controller is set as the default controller in
	 * config/routes.php, it's displayed at http://example.com/
	 *
	 * So any other public methods not prefixed with an underscore will
	 * map to /index.php/welcome/<method_name>
	 * @see https://codeigniter.com/user_guide/general/urls.html
	 */
	public function index()
	{
		$this->load->view('welcome_message');
	}
	public function login(){
	    $nombre=$_POST['nombre'];
        $clave=$_POST['clave'];
	    $query=$this->db->query("SELECT * FROM users WHERE nombre='$nombre' AND clave='$clave'");
//	    echo $query->num_rows();
	    if ($query->num_rows()==1){
	        $row=$query->row();
	        $_SESSION['nombre']=$row->nombre;
            $_SESSION['nombrecompleto']=$row->nombrecompleto;
            $_SESSION['iduser']=$row->iduser;
            $_SESSION['tipo']=$row->tipo;
            header('Location: '.base_url().'Admin');
        }else{
            header('Location: '.base_url());
        }
    }
    public function logout(){
	    session_destroy();
        header('Location: '.base_url());
    }
    public function register(){
        $this->load->view('register');
    }
    public function insert(){
        $nombre= strtoupper( $_POST['nombre']);
        $clave=$_POST['password'];
        $unidad=$_POST['unidad'];
        $nombrecompleto=$_POST['nombrecompleto'];
        $celular=$_POST['celular'];
        $this->db->query("INSERT INTO users SET 
nombre='$nombre',
clave='$clave',
unidad='$unidad',
nombrecompleto='$nombrecompleto',
celular='$celular'
");
        header('Location: '.base_url());
    }
}
