<%@ Page Title="Dashboard - Expenses" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

  <div class="row">
    <div class="col-md-4 mb-4">
      <div class="card border-left-success shadow h-100 py-2">
        <div class="card-body">
          <div class="row no-gutters align-items-center">
            <div class="col mr-2">
              <div class="text-xs font-weight-bold text-success text-uppercase mb-1">Income (Total)</div>
              <div class="h5 mb-0 font-weight-bold text-gray-800" runat="server" id="totalIncome">$0</div>
            </div>
            <div class="col-auto">
              <i class="fas fa-piggy-bank fa-2x text-gray-300"></i>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="col-md-4 mb-4">
      <div class="card border-left-primary shadow h-100 py-2">
        <div class="card-body">
          <div class="row no-gutters align-items-center">
            <div class="col mr-2">
              <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">Expense (Total)</div>
              <div class="h5 mb-0 font-weight-bold text-gray-800" runat="server" id="totalExpense">$0</div>
            </div>
            <div class="col-auto">
              <i class="fas fa-money-bill-wave fa-2x text-gray-300"></i>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="col-md-4 mb-4">
      <div class="card border-left-info shadow h-100 py-2">
        <div class="card-body">
          <div class="row no-gutters align-items-center">
            <div class="col mr-2">
              <div class="text-xs font-weight-bold text-info text-uppercase mb-1">Wallet (Total)</div>
              <div class="h5 mb-0 font-weight-bold text-gray-800" runat="server" id="totalWallet">$0</div>
            </div>
            <div class="col-auto">
              <i class="fas fa-wallet fa-2x text-gray-300"></i>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

  <div class="row">
    <div class="col-md-7 mb-4">
      <div class="card border-bottom-warning shadow h-100 py-2">
        <div class="card-body">
          <div class="row">
            <div class="col-12">
              <h5>Recent Transactions: <small>(Top 20 within 30 days)</small></h5>
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
                <tbody  runat="server" id="tableBody">
                  <tr>
                    <td>Tiger Nixon</td>
                    <td>System Architect</td>
                    <td>Edinburgh</td>
                  </tr>
                </tbody>
              </table>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="col-md-5 mb-4">
      <div class="card border-bottom-warning shadow h-100 py-2">
        <div class="card-body">
          <div class="row">
            <div class="col-12 text-center">
              <h3>Tip of the Week:</h3>
              <p runat="server" id="txtTip"></p>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</asp:Content>