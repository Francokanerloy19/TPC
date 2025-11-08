<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Yapago.aspx.cs" Inherits="TPC.Yapago" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <style>
        .centrar-vertical {
            min-height: 70vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }
    </style>

    <div class="centrar-vertical">

        <div class="container mt-5">
            <h2 class="text-center mb-4">Estado del pago</h2>

            <div class="row justify-content-center">
               
                <div class="col-md-4 mb-3">
                    <div class="card text-center shadow-lg border-success">
                        <div class="card-header bg-success text-white">
                            <h4 style="font-size: 2rem;">Ya pagó</h4>
                        </div>
                    </div>
                </div>
            </div>

            <div class="text-center mt-4">
                <asp:Button Text="Volver" ID="btnVolver" runat="server" CssClass="btn btn-danger"  OnClick="btnVolver_Click"/>
            </div>
        </div>
    </div>
</asp:Content>
