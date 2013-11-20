const semanasSemestre = 16;
const horasCredito = 48;
$(window).load(function(){
	$('#field-horas_teoricas,#field-horas_practicas').on('keyup',function(){
		var horasTeoricas = parseInt($('#field-horas_teoricas').val());
		var horasPracticas = parseInt($('#field-horas_practicas').val());
		var horasTotales = horasTeoricas + horasPracticas;
		var unidadesCredito = (horasTotales*semanasSemestre)/horasCredito;
		unidadesCredito = Math.ceil(unidadesCredito);
		$('#field-total_horas').html(horasTotales);
		$('#field-uni_credito').html(unidadesCredito);
	});

});