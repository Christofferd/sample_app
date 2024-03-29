// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require_tree .

$(function () {
  $('#products th a').live('click',
    function () {
      $.getScript(this.href);
      return false;
    }
  );
  
  $('#products_search input').keyup(function () {
    $.get($("#products_search").attr("action"), $("#products_search").serialize(), null, 'script');
    return false;
  });
});

$(function () {
  $('#purchases th a').live('click',
    function () {
      $.getScript(this.href);
      return false;
    }
  );
  
  $('#purchases_search input').keyup(function () {
    $.get($("#purchases_search").attr("action"), $("#purchases_search").serialize(), null, 'script');
    return false;
  });
});

$(function () {
  $('#supplierproducts th a').live('click',
    function () {
      $.getScript(this.href);
      return false;
    }
  );
  
  $('#supplierproducts_search input').keyup(function () {
    $.get($("#supplierproducts_search").attr("action"), $("#supplierproducts_search").serialize(), null, 'script');
    return false;
  });
});

$(function () {
  $('#suppliers th a').live('click',
    function () {
      $.getScript(this.href);
      return false;
    }
  );
  
  $('#suppliers_search input').keyup(function () {
    $.get($("#suppliers_search").attr("action"), $("#suppliers_search").serialize(), null, 'script');
    return false;
  });
});

$(function () {
  $('#orders th a').live('click',
    function () {
      $.getScript(this.href);
      return false;
    }
  );
  
  $('#orders_search input').keyup(function () {
    $.get($("#orders_search").attr("action"), $("#orders_search").serialize(), null, 'script');
    return false;
  });
});