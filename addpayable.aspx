<%@ Page Title="Add Due Date - Expenses" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="addpayable.aspx.cs" Inherits="addpayable" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
  <div class="row">
    <div class="col-12">
      <h3>Add New Due Date</h3>
    </div>
  </div>
  <div class="row">
    <div class="col-md-12 col-lg-6 offset-lg-3">
      <div class="card shadow py-2">
        <div class="card-body">
          <div class="row">
            <div class="col-12" runat="server" id="divNotif">
            </div>
          </div>
          <div class="row">
            <div class="col-12">
              <label class="form-control-plaintext">Name</label>
              <input type="text" class="form-control" runat="server" id="txtName" name="name" placeholder="Name of Bill" />

              <label class="form-control-plaintext">Amount</label>
              <input type="number" class="form-control" runat="server" id="txtAmount" name="amount" placeholder="Amount of Bill" />

              <label class="form-control-plaintext">Type</label>
              <select class="form-control selectType" runat="server" id="selType" onchange="toggleType();" name="type">
                <option value="0">Monthly</option>
                <option value="1">Exact Date</option>
              </select>

              <div class="row m-0" id="divDueDay">
                <div class="col-12 p-0">
                  <label class="form-control-plaintext">Due Day <small>(day of the month)</small></label>
                  <input
                    type="number"
                    min="1"
                    max="30"
                    class="form-control"
                    runat="server"
                    id="txtDueDay"
                    name="duedate"
                    placeholder="example: 24, every 24th of the month" />
                </div>
              </div>

              <div class="row m-0 d-none" id="divDueDate">
                <div class="col-12 p-0">
                  <label class="form-control-plaintext">Due Date <small>(exact date of bill)</small></label>
                  <input type="date" class="form-control" runat="server" id="txtDueDate" name="duedate" placeholder="Exact Date" />
                </div>
              </div>

              <button class="btn btn-primary mt-4 col-6 offset-3" runat="server" id="btnSubmit" onserverclick="btnSubmit_ServerClick">Submit</button>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="scriptsHolder" runat="Server">
  <script>
    function toggleType() {
      if ($('.selectType').children("option:selected").val() == "0") {
        $('#divDueDay').removeClass("d-none");
        $('#divDueDate').addClass("d-none");
      } else {
        $('#divDueDay').addClass("d-none");
        $('#divDueDate').removeClass("d-none");
      }
    }
  </script>
</asp:Content>