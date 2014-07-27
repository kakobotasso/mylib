// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(function(){
  $("#estrelas").raty(
    {
      scoreName: 'book[grade]',
      half: true,
      halfShow: true,
      score: gon.nota
    }
  );

  $("#grupoLido input").change(function(){
    var valor = $(this).val();
    if(valor === 'true'){
      $("#grupoNotas").slideDown(500);
    }else{
      $("#grupoNotas").slideUp(500);
    }
  });
});