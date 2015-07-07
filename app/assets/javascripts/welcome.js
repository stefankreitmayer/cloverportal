$(document).ready(function(){
  $('#menutoggle').on('click', openMenu);
  $(document).on('click', closeMenuIfAppropriate);
  bindMenuItems();
  focusOnStudentInput();
  updateTeacherContent();
});

function focusOnStudentInput(){
  $('#groupname').focus();
}
function openMenu(){
  $('#menu').delay(100).slideDown();
}

function closeMenuIfAppropriate(e){
  if(e.target.nodeName=='BODY' ||
      $(e.target).attr('id')=='student-login' ||
      $('#student-login').find(e.target).length
    ){
    $('#menu').slideUp();
    $('#menu ul li').removeClass('selected');
    updateTeacherContent();
    focusOnStudentInput();
  }
}

function bindMenuItems(){
  $('#menu ul li').each(function(index){
    $(this).on('click', function(){
      $('#menu ul li').removeClass('selected');
      $(this).addClass('selected');
      updateTeacherContent();
    });
  });
}

function updateTeacherContent(){
  var teacherContent = $('#teacher-content');
  var menu = $('#menu ul');
  // show selected page
  var selected = menu.children('.selected');
  if(selected.length>0){
    var page = teacherPageForMenuItem(selected);
    page.show();
    page.animate({right: $('#menu').width(), opacity: 1});
  }
  // hide unselected pages
  var unselected = menu.children().not('.selected');
  unselected.each(function(index, menuitem){
    var page = teacherPageForMenuItem($(menuitem));
    page.animate({right: $('#menu').width()*.8, opacity: 0},
      300, '', function(){
        page.hide();
        page.css({right: $('#menu').width()*.2});
      });
  });
}

function teacherPageForMenuItem(menuitem){
  pageId = menuitem.attr('id').replace(/menuitem-/, 'page-');
  return $('#'+pageId);
}
