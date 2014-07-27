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
});