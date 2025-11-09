<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="VerMembresia.aspx.cs" Inherits="TPC.VerMembresia" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .centrar-vertical {
            min-height: 70vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }
    </style>
    <p class="text-center text-white  display-3">Membresia</p>

    <div class="centrar-vertical">
        <columns>

        
        <div class="card shadow-lg border-success">
            <div class="card-header bg-success text-white text-center">
                <h4>Gestión del Socio</h4>
            </div>
            <div class="card-body bg-dark text-light">

                <div class="row mb-3">
                    <div class="col">
                        <label class="fw-bold">Membresia:</label>
                        <asp:Label ID="lblMembresia" runat="server"></asp:Label>
                    </div>

                    <div class="col">
                        <label class="fw-bold">Actividad Extra:</label>
                        <asp:Label ID="lblActividad" runat="server"></asp:Label>
                    </div>

                    <div class="col">
                        <label class="fw-bold">Descripcion:</label>
                        <asp:Label ID="lblDescripcion" runat="server"></asp:Label>
                    </div>
                </div>
                <div class="d-flex justify-content-center gap-3">
                </div>
            </div>
             
        </div>
            <br />
            <br />
       <asp:Button Text="Volver" ID="btnVolver" runat="server" CssClass="btn btn-outline-danger btn-lg" OnClick="btnVolver_Click" />

    </columns>
        </div>
</asp:Content>
