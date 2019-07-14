<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="profile.aspx.cs" Inherits="profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
  <div class="row">
    <div class="col-sm-12 col-md-6 col-lg-4 offset-md-3 offset-lg-4">
      <div class="card border-bottom-primary shadow h-100 py-2">
        <div class="card-body">
          <div class="row">
            <div class="col-12 text-center">
              <i class="fas fa-user fa-2x text-gray-300"></i>
            </div>
          </div>
          <div class="row mt-2 mb-2">
            <div class="col-12 text-center">
              <h4 class="text-primary"><%=mdlUser.Name %></h4>
            </div>
          </div>
          <div class="row no-gutters align-items-center">
            <div class="col-12 mr-2">
              <div class="text-xs font-weight-bold text-gray-800 text-uppercase mb-1">Username:</div>
              <div class="mb-0 font-weight-bold text-primary mb-2"><%=mdlUser.Username %></div>
            </div>
            <div class="col-12 mr-2">
              <div class="text-xs font-weight-bold text-gray-800 text-uppercase mb-1">Date Created:</div>
              <div class="mb-0 font-weight-bold text-primary"><%=mdlUser.DateCreated %></div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</asp:Content>