var btn_cargar = document.getElementById('btn_cargar_usuarios');
var error_box = document.getElementById('error_box');
var tabla = document.getElementById('tabla');
var loader = document.getElementById('loader');

var placa = document.getElementById('placa');
var valor = document.getElementById('valor');
var obj = document.getElementById('fecha_inicio');
var obj3 = document.getElementById('fecha_fin');
//obj.value = setFormato(new Date());

var usuario_placa,
	usuario_fecha_inicio,
	usuario_fecha_fin;


function objetoAjax() {
	var xmlhttp = false;
	try {
		xmlhttp = new ActiveXObject("Msxml2.XMLHTTP");
	} catch (e) {

		try {
			xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		} catch (E) {
			xmlhttp = false;
		}
	}

	if (!xmlhttp && typeof XMLHttpRequest != 'undefined') {
		xmlhttp = new XMLHttpRequest();
	}
	return xmlhttp;
}

function AddMes() {
	var fecha = new Date(obj.value);
	fecha.setMonth(fecha.getMonth() + 1);
	obj3.value = setFormato(fecha);
	obj3.setAttribute("disabled", "true");
}

function setFormato(fecha) {
	var day = ("0" + fecha.getDate()).slice(-2);
	var month = ("0" + (fecha.getMonth() + 1)).slice(-2);
	//var date = (day) + "-" + (month) + "-" + fecha.getFullYear();
	var date = fecha.getFullYear() + "-" + (month) + "-" + (day);
	return date;
}

function cargarUsuarios() {
	tabla.innerHTML = '<tr><th>ID</th><th>Placa</th><th>Fecha Inicio</th><th>Fecha Fin</th><th>Estado</th><th>Valor Mes</th><th>Opciones</th></tr>';

	var peticion = new XMLHttpRequest();
	peticion.open('GET', 'pagos.php');

	loader.classList.add('active');
	peticion.onload = function () {
		var datos = JSON.parse(peticion.responseText);
		console.log(datos);
		if (datos.error) {
			error_box.classList.add('active');
		} else {

			for (var i = 0; i < datos.length; i++) {
				var elemento = document.createElement('tr');
				elemento.innerHTML += ("<td>" + datos[i].id + "</td>");
				elemento.innerHTML += ("<td>" + datos[i].Placa + "</td>");
				elemento.innerHTML += ("<td>" + datos[i].Fecha_Inicio + "</td>");
				elemento.innerHTML += ("<td>" + datos[i].Fecha_Fin + "</td>");
				elemento.innerHTML += ("<td>" + datos[i].Estado + "</td>");
				elemento.innerHTML += ("<td>" + datos[i].Valor_Mes + "</td>");
				elemento.innerHTML += ("<td><div class='botones'> <button class='editar_btn' id='editar'> <img class='editar'  style='width:20px;height:30px;' src='../../imagenes/editar.svg'/></button><button id='eliminar' class='eliminar_btn'> <img class='eliminar' style='width:20px;height:30px;' src='../../imagenes/eliminar.svg'/></button></div></td>");

				tabla.appendChild(elemento);

			}
			var modal = document.getElementById('myModal');
			var modal1 = document.getElementById('myModal1');
			var span1 = document.getElementsByClassName("close")[1];
			var span = document.getElementsByClassName("close")[0];

			$(".editar_btn").on("click", function () {

				var id = $(this).closest('tr').children()[0].textContent;
				var placa = $(this).closest('tr').children()[1].textContent;
				var fecha_inicio = $(this).closest('tr').children()[2].textContent;
				var fecha_fin = $(this).closest('tr').children()[3].textContent;
				var estado = $(this).closest('tr').children()[4].textContent;
				var valor = $(this).closest('tr').children()[5].textContent;
				fecha_i = formato(fecha_inicio);
				fecha_f = formato(fecha_fin);
				console.log(fecha_i);
				document.getElementById('id').value = id;
				document.getElementById('placa_editar').value = placa;
				document.getElementById('valor_editar').value = valor;
				document.getElementById('fecha_inicio_editar').value = fecha_inicio;
				document.getElementById('fecha_fin_editar').value = fecha_fin;
				modal.style.display = "block";
				span.onclick = function () {
					modal.style.display = "none";
				}

				function formato(fecha_inicio) {
					return fecha_inicio.replace(/^(\d{4})-(\d{2})-(\d{2})$/g, '$3/$2/$1');
				}

			});
			$(".eliminar_btn").on("click", function () {
				modal1.style.display = "block";
				var id = $(this).closest('tr').children()[0].textContent;
				var placa = $(this).closest('tr').children()[1].textContent;
				document.getElementById('ide').value = id;
				document.getElementById('placa_eliminar').value = placa;
				span1.onclick = function () {
					modal1.style.display = "none";
				}
			});


			//			var editar = document.getElementsByClassName('editar_btn');
			//			var eliminar = document.getElementsByClassName('eliminar_btn');
			//			var modal = document.getElementById('myModal');
			//			var modal1 = document.getElementById('myModal1');
			//			var span = document.getElementsByClassName("close")[0];
			//			var span1 = document.getElementsByClassName("close")[1];
			//			console.log(editar);
			//			console.log(eliminar);
			//			editar.addEventListener("click", function () {
			//				modal.style.display = "block";
			//			});
			//			eliminar.addEventListener("click", function () {
			//				modal1.style.display = "block";
			//			});
			//			span.onclick = function () {
			//				modal.style.display = "none";
			//			}
			//			span1.onclick = function () {
			//				modal1.style.display = "none";
			//			}
			//
			//			window.onclick = function (event) {
			//				if (event.target == modal) {
			//					modal.style.display = "none";
			//				}
			//			}
			//			window.onclick = function (event) {
			//				if (event.target == modal1) {
			//					modal1.style.display = "none";
			//				}
			//			}
		}
	}


	peticion.onreadystatechange = function () {
		if (peticion.readyState == 4 && peticion.status == 200) {
			loader.classList.remove('active');
		}
	}
	peticion.send();

}

function formulario_valido() {
	if (usuario_placa == '') {
		return false;
	} else if (usuario_fecha_inicio == '') {
		return false;

	} else if (usuario_fecha_fin == '') {
		return false;
	}
	return true;

}
$("#cambiar").on("click", function (e) {
	e.preventDefault();
	modificarPago();
});
$("#eliminar").on("click", function (e) {
	e.preventDefault();
	eliminarPago();
});

function eliminarPago() {
	ajax = objetoAjax();
	ajax.open("POST", "eliminar.php", !0);

	usuario_id = formulario_eliminar.ide.value.trim();

	var modal = document.getElementById('myModal1');



	error_box.classList.remove('active');
	var parametros = 'id=' + usuario_id;
	console.log(parametros);


	loader.classList.add('active');

	ajax.onreadystatechange = function () {

		if (ajax.readyState == 4 && ajax.status == 200) {
			loader.classList.remove('active');
			var recibido = (ajax.responseText);
			console.log(recibido);
			if (recibido != "error") {
				modal.style.display = "none";
				cargarUsuarios();

			} else {
				error_box.classList.add('active');
				error_box.innerHTML = 'No se pudo eliminar el registro, Verifique por favor.';
			}
		}
	}
	ajax.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	ajax.send(parametros);

}


function modificarPago() {
	ajax = objetoAjax();
	ajax.open("POST", "insertar.php", !0);

	usuario_placa = formulario_editar.placa.value.trim();
	usuario_fecha_inicio = formulario_editar.fecha_inicio.value.trim();
	usuario_fecha_fin = formulario_editar.fecha_fin.value.trim();
	usuario_valor_mes = formulario_editar.valor.value.trim();
	usuario_id = formulario_editar.id.value.trim();
	var modal = document.getElementById('myModal');



	error_box.classList.remove('active');
	var parametros = 'placa=' + usuario_placa + '&fecha_inicio=' + usuario_fecha_inicio + '&valor_mes=' + usuario_valor_mes + '&fecha_fin=' + usuario_fecha_fin+ '&id=' + usuario_id;
	console.log(parametros);


	loader.classList.add('active');

	ajax.onreadystatechange = function () {

		if (ajax.readyState == 4 && ajax.status == 200) {
			loader.classList.remove('active');
			var recibido = (ajax.responseText);
			console.log(recibido);
			if (recibido != "error") {
				modal.style.display = "none";
				cargarUsuarios();
				formulario.placa.value = '';
				formulario.fecha_inicio.value = '';
				formulario.fecha_fin.value = '';
			} else {
				error_box.classList.add('active');
				error_box.innerHTML = 'La placa ingresada no tiene mensualidad, Verifique por favor.';
			}
		}
	}
	ajax.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	ajax.send(parametros);

}

function agregarUsuarios(e) {
	e.preventDefault();

	ajax = objetoAjax();
	ajax.open("POST", "insertar.php", !0);

	usuario_placa = formulario.placa.value.trim();
	usuario_fecha_inicio = formulario.fecha_inicio.value.trim();
	usuario_fecha_fin = formulario.fecha_fin.value.trim();
	usuario_valor_mes = formulario.valor.value.trim();


	if (formulario_valido()) {
		error_box.classList.remove('active');
		var parametros = 'placa=' + usuario_placa + '&fecha_inicio=' + usuario_fecha_inicio + '&valor_mes=' + usuario_valor_mes + '&fecha_fin=' + usuario_fecha_fin;
		console.log(parametros);


		loader.classList.add('active');

		ajax.onreadystatechange = function () {

			if (ajax.readyState == 4 && ajax.status == 200) {
				loader.classList.remove('active');
				var recibido = (ajax.responseText);
				console.log(recibido);
				if (recibido != "error") {
					cargarUsuarios();
					formulario.placa.value = '';
					formulario.fecha_inicio.value = '';
					formulario.fecha_fin.value = '';
				} else {
					error_box.classList.add('active');
					error_box.innerHTML = 'La placa ingresada no tiene mensualidad, Verifique por favor.';
				}
			}
		}
		ajax.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
		ajax.send(parametros);

	} else {
		error_box.classList.add('active');
		error_box.innerHTML = 'Por favor completa el formulario correctamente';
	}

}

placa.addEventListener('focus', function (e) {
	error_box.classList.remove('active');
	valor.value = '';
	valor.setAttribute("disabled", "false");
});
placa.addEventListener('focusout', function (e) {
	var equipo = document.getElementById('placa').value;
	if (placa.value == "") {
		error_box.classList.add("active")
		error_box.style.background = "orange";
		error_box.innerHTML = "Por favor digite una placa que se encuentre registrada";
	} else {

		var respuesta = 0;

		//instanciamos el objetoAjax
		ajax = objetoAjax();

		//Abrimos una conexi??n AJAX pasando como par??metros el m??todo de env??o, y el archivo que realizar?? las operaciones deseadas
		ajax.open("POST", "consulta.php", true);

		//cuando el objeto XMLHttpRequest cambia de estado, la funci??n se inicia
		ajax.onreadystatechange = function () {

			//Cuando se completa la petici??n, mostrar?? los resultados
			if (ajax.readyState == 4 && ajax.status == 200) {

				//El m??todo responseText() contiene el texto de nuestro 'consultar.php'. Por ejemplo, cualquier texto que mostremos por un 'echo'
				respuesta = (ajax.responseText)
				//console.log(respuesta);
				if (respuesta != "error") {
					valor.value = respuesta;
					valor.setAttribute("disabled", "true");
				} else {
					error_box.classList.add('active');
					error_box.innerHTML = 'La placa ingresada no tiene mensualidad, Verifique por favor.';
				}
			}
		}
		//Llamamos al m??todo setRequestHeader indicando que los datos a enviarse est??n codificados como un formulario.
		ajax.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
		var parametro = "placa=" + equipo;
		//console.log(parametro);
		//enviamos las variables a 'consulta.php'
		ajax.send(parametro)
	}

});

btn_cargar.addEventListener('click', function () {
	cargarUsuarios();
});


formulario.addEventListener('submit', function (e) {
	agregarUsuarios(e);
});

obj.addEventListener('focusout', function () {
	AddMes();
});
