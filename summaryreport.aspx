<%@ Page Title="Summary - Expenses" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="summaryreport.aspx.cs" Inherits="summaryreport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
  <!-- Custom styles for this page -->
  <link href="vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
  <h3>Summary:</h3>

  <div class="row mb-4">
    <div class="col-12">
      <div class="card shadow py-1">
        <div class="card-body">
          <div class="row">
            <div class="col-12" style="overflow-x: auto;">
              <table class="table table-bordered" id="dataTable">
                <thead>
                  <tr>
                    <th>Date</th>
                    <th>Category</th>
                    <th>Amount</th>
                  </tr>
                </thead>
                <tfoot>
                  <tr>
                    <th>Date</th>
                    <th>Category</th>
                    <th>Amount</th>
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

  <div class="row">
    <div class="col-6">
      <div class="card shadow py-1 border-bottom-success">
        <div class="card-body">
          <h4>Income</h4>
          <table class="table table-bordered">
            <thead>
              <tr>
                <th>Name</th>
                <th>Amount</th>
              </tr>
            </thead>
            <tbody runat="server" id="incomeBody">
              <tr>
                <th>Name</th>
                <th>Amount</th>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
    </div>
    <div class="col-6">
      <div class="card shadow py-1 border-bottom-danger">
        <div class="card-body">
          <h4>Expense</h4>
          <table class="table table-bordered">
            <thead>
              <tr>
                <th>Name</th>
                <th>Amount</th>
              </tr>
            </thead>
            <tbody runat="server" id="expenseBody">
              <tr>
                <th>Name</th>
                <th>Amount</th>
              </tr>
            </tbody>
          </table>
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
</asp:Content>