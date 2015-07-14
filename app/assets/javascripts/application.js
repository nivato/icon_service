// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require angular
//= require angular-route
//= require_tree .

(function(){
    var app = angular.module('Images', ['ngRoute']);

    app.config(['$locationProvider', function($locationProvider){
        $locationProvider.html5Mode({enabled: true, requireBase: false});
    }]);

    app.controller('ApplicationController', ['$scope', '$http', function($scope, $http){
        var ctrl = this;
        this.image = {};
        this.images = [];

        this.getImages = function(){
            $http.get('/images.json')
                .success(function(response, status, headers, config){
                    ctrl.images = response.data;
                })
                .error(function(response, status, headers, config){
                    console.log(response);
                });
        };

        this.submitImage = function(){
            $http.post('/images.json', this.image)
                .success(function(response, status, headers, config){
                    ctrl.image = {};
                    ctrl.getImages();
                })
                .error(function(response, status, headers, config){
                    console.log(response);
                });
        };

        this.getImages();

    }]);

})();
