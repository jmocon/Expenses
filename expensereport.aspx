<%@ Page Title="Expense Report - Expenses" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="expensereport.aspx.cs" Inherits="expensereport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
  <!-- Custom styles for this page -->
  <link href="vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
  <h3>Expense:</h3>
  <div class="row">
    <div class="col-12">
      <div class="card shadow py-1">
        <div class="card-body">
          <div class="row">
            <div class="col-12" id="notification">
            </div>
          </div>
          <div class="row">
            <div class="col-12" style="overflow-x: auto;">
              <table class="table table-bordered" id="dataTable">
                <thead>
                  <tr>
                    <th>Date</th>
                    <th>Category</th>
                    <th>Amount</th>
                    <th>Action</th>
                  </tr>
                </thead>
                <tfoot>
                  <tr>
                    <th>Date</th>
                    <th>Category</th>
                    <th>Amount</th>
                    <th>Action</th>
                  </tr>
                </tfoot>
                <tbody runat="server" id="tableBody">
                </tbody>
              </table>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="scriptsHolder" runat="Server">
  <!-- Page level plugins -->
  <script src="vendor/datatables/jquery.dataTables.min.js"></script>
  <script src="vendor/datatables/dataTables.bootstrap4.min.js"></script>

  <!-- Page level custom scripts -->
  <script src="js/demo/datatables-demo.js"></script>

  <script>
    function deleteTransaction(id) {
      var url = "deleteTransaction.aspx";
      var param = "";

      var xmlhttp = new XMLHttpRequest();
      xmlhttp.onreadystatechange = function () {
        if (this.readyState == 4 && this.status == 200) {

          let notif = `
              <div class="alert alert-success alert-dismissible" role="alert">
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                  <span aria-hidden="true">×</span>
                  <span class="sr-only">Close</span>
                </button>
                Successfully Deleted
              </div>
            `;
          var table = $('#dataTable').DataTable();
          table.rows('#tr' + id).remove().draw();

          $('#notification').html(notif);
        } else {
          
          let notif = `
              <div class="alert alert-danger alert-dismissible" role="alert">
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                  <span aria-hidden="true">×</span>
                  <span class="sr-only">Close</span>
                </button>
                Error Encountered. Please refresh the page.
              </div>
            `;
          var table = $('#dataTable').DataTable();
          table.rows('#tr' + id).remove().draw();

          $('#notification').html(notif);
        }
      };
      param += "Id=" + id;
      xmlhttp.open("POST", url, true);
      xmlhttp.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
      xmlhttp.send(param);
    }
  </script>
</asp:Content>