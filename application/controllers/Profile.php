<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Profile extends CI_Controller
{
    public function index()
    {
        if (!isset($_SESSION['nombre'])) {
            header('Location: ' . base_url());
        }
        $this->load->view('templates/header');
        $this->load->view('profile');
        $this->load->view('templates/footer');
    }
}
