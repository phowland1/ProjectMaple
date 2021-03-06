<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html ng-app="ProjectMaple">

<head>
    <title>Project Maple</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
    <script src="<%=request.getContextPath()%>/resources/node_modules/jquery/dist/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/app.css"/>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/node_modules/angular-ui-bootstrap/dist/ui-bootstrap-csp.css"/>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/node_modules/angular/angular.js"></script>
    <script src="<%=request.getContextPath()%>/resources/node_modules/angular-ui-bootstrap/dist/ui-bootstrap-tpls.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/app.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/controller/FactoryController.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/controller/GenerateController.js"></script>
</head>
<body>
<div class="container" id="tree-container" ng-controller="FactoryController" >
    <script type="text/ng-template" id="generateModal.html">
        <div class="modal-body">
            <form name="generateForm">
                <label for="item_count">Item Count:</label>
                <input name="itemCount" id="item_count" type="number" ng-model="count" min="1" max="15" integer>
                <br/>
                <span class="error" ng-show="generateForm.itemCount.$error.integer">Whole numbers only please!</span>
                <span class="error" ng-show="generateForm.itemCount.$error.min || form.size.$error.max"> Must be between 1 and 15</span>
            </form>
        </div>
        <div class="modal-footer">
            <button class="btn btn-primary pull-left" ng-click="onGenerateClick()">Generate</button>
            <button class="btn btn-warning " ng-click="onDeleteClick()">Delete</button>
        </div>
    </script>

    <div class="ng-cloak">
        <ul id="maple">
            <div class="header"><strong>Factories</strong></div>
            <ul>
                <div ng-repeat="factory in factories">
                    <li id="factory_{{factory.id}}">
                        <strong><a ng-click="onGenerateClick(factory.id)">{{factory.name}}</a>({{factory.lowerLimit}} : {{factory.upperLimit}}) </strong>
                        <a ng-click="onEditClick(factory.id)" href="#addFactory">
                            <i class="glyphicon glyphicon-edit"></i></a>
                        <ul>
                            <li ng-repeat="number in factory.numbers track by $index">{{number}}</li>
                        </ul>
                    </li>
                </div>
            </ul>
        </ul>
        <div id="addFactoryPanel">
            <a id="addFactoryBtn" class="btn btn-primary" data-toggle="collapse" href="#addFactory" role="button" aria-expanded="false"
               aria-controls="addFactory">Add Factory</a>
            <div class="collapse" id="addFactory">
                <div class="card card-body">
                    <div class="row">
                        <label class="col-md-5" for="new-factory-name">Name: </label>
                        <input type="text" ng-model="factory.name" id="new-factory-name">
                        <br/>

                        <label class="col-md-5" for="new-factory-lower">Lower Limit: </label>
                        <input type="number" ng-model="factory.lowerLimit" id="new-factory-lower">
                        <br/>

                        <label class="col-md-5" for="new-factory-upper">Upper Limit: </label>
                        <input type="number" ng-model="factory.upperLimit" id="new-factory-upper">
                        <br/>

                        <a id="saveFactory" class="btn btn-primary col-md-offset-9" data-toggle="collapse"
                           href="#addFactory" role="button" aria-expanded="false"
                           aria-controls="addFactory" ng-click="onAddClick()">Save</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>