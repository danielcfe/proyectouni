<?php
	class materia_Controller extends CI_Controller{

		public function index( $value = '' )
		{
			$this->all($value);
		}


		function all($operacion=0)
		{
			$this->load->library('grocery_crud');
		    $crud = new grocery_CRUD();
		    $crud->set_theme('twitter-bootstrap');
		    $crud->set_language('spanish');
		 
		    $crud->set_table('materia')
		        ->set_subject('Materia');

		    $crud->fields('codigo','nombre','horas_teoricas','horas_practicas','total_horas','uni_credito','cod_prelacion');

		  $crud->display_as('codigo','Código')
		//  ->display_as('horas_teoricas','Fecha de Nacimiento')
		  ->display_as('fecha_nac','Horas Teóricas')
		  ->display_as('total_horas','Total de Horas')
		  ->display_as('uni_credito','Unidades de Crédito')
		  ->display_as('cod_prelacion','Código de Prelación');
		    



if($operacion == 'insert_validation'){
		    $crud->set_rules('codigo', 'Codigo de materia', 'trim|required|is_unique[materia.codigo]|length[7]');
		    $crud->set_rules('nombre', 'Nombre de la materia', 'trim|required|is_unique[materia.nombre]');
		    $crud->set_rules('horas_teoricas', 'Horas teoricas', 'required|is_numeric');
		    $crud->set_rules('horas_practicas', 'Horas materia', 'required|is_numeric');
		    $crud->set_rules('total_horas', 'Total de horas', 'required|is_numeric');
		    $crud->set_rules('uni_credito', 'Unidades de credito', 'required|is_numeric');
		}
if($operacion == 'update_validation'){
		   // $crud->set_rules('codigo', 'Codigo de materia', 'required|is_unique[materia.codigo]|length[7]');
			$id = $this->uri->segment(4);
			var_dump($id);
		    $crud->set_rules('nombre', 'Nombre de la materia', 'trim|required|is_unique[materia.nombre.id.'.$id.']');
		    $crud->set_rules('horas_teoricas', 'Horas teoricas', 'required|is_numeric');
		    $crud->set_rules('horas_practicas', 'Horas materia', 'required|is_numeric');
		    $crud->set_rules('total_horas', 'Total de horas', 'required|is_numeric');
		    $crud->set_rules('uni_credito', 'Unidades de credito', 'required|is_numeric');
		}
		$crud->field_type('total_horas', 'readonly');
		$crud->field_type('uni_credito', 'readonly');

$crud->set_relation('cod_prelacion','materia','{codigo} ({nombre})');
		   
		       //->columns('nombre','horas_teoricas','horas_practicas','total_horas','uni_credito','cod_prelacion');
		 
		  // $crud->fields('nombre','horas_teoricas','horas_practicas','total_horas','uni_credito','cod_prelacion');
		 /*   $crud->required_fields('nombre','horas_teoricas');
		 	$crud->set_relation('cod_prelacion','materia','nombre');
*/
		    $output = $crud->render();
		 
		    $output->js_files['hdfr54dtjd'] = base_url().'assets/js/materia/editMateria.js';
		    $this->smarty->assign('output',$output->output);
		    $this->smarty->assign('css_files',$output->css_files);
		    $this->smarty->assign('js_files',$output->js_files);
		    $this->smarty->display('index.tpl');
		}

/*			public function unique_edit_check($text, $field){
			//
			$systemID = $this->uri->segment(4);
			$this->system->load( array('id' => $systemID) );
			$element = array( 'name' => $field, 'value' => $text);

			if( $this->system->validate( $element ) ){
				return true;
			}else{
				$this->form_validation->set_message('unique_edit_check', "El campo %s ya esta registrado.");
				return false;
			}
		}*/

	}