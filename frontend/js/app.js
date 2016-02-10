'use strict';

var autocv = angular.module('autocv', ['ui.router', 'ngToast'])
  .config(function($stateProvider, $urlRouterProvider) {
    $urlRouterProvider.otherwise("/home");

    $stateProvider
      .state('home', {
        url: "/home",
        templateUrl: "templates/peoplelist.html",
        controller: "PeopleCtrl"
      })
      .state('edit', {
        url: "/edit/:email",
        templateUrl: "templates/editperson.html",
        controller: "EditCtrl"
      })
      .state('add', {
        url: "/add",
        templateUrl: "templates/editperson.html",
        controller: "EditCtrl"
      })
      .state('tags', {
        url: "/tags",
        templateUrl: "templates/tags/tagList.html",
        controller: "TagsCtrl"
      })
      .state('match', {
        url: "/match",
        templateUrl: "templates/match.html",
        controller: "MatchCtrl"
      });
  });
