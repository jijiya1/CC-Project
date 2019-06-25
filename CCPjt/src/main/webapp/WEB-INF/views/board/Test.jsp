<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div class="col-sm-12 col-md-6">
	<div class="dataTables_length" id="dataTable_length">
		<label>Show 
			<select name="dataTable_length" aria-controls="dataTable"
			   class="custom-select custom-select-sm form-control form-control-sm">
				<option value="10">10</option>
				<option value="25">25</option>
				<option value="50">50</option>
				<option value="100">100</option>
			</select> 
		entries</label>
	</div>
</div>
<div class="col-sm-12 col-md-6">
	<div id="dataTable_filter" class="dataTables_filter">
		<label>Search:
			<input type="search" class="form-control form-control-sm"
			 placeholder="" aria-controls="dataTable">
		</label>
	</div>
	</div>

</body>
</html>