<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DatosPersonales.aspx.cs" Inherits="TPC.DatosPersonales" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
   <div class="container mt-4">
    <div class="card shadow-lg border-light bg-dark text-white">
        <div class="card-header bg-secondary text-white text-center">
            <h3>Datos personales</h3>
        </div>

        <div class="card-body">
            <div class="row mb-3">
                <div class="col">
                    <label class="fw-bold">DNI:</label>
                    <p><%# Eval("DNI") %></p>
                </div>
            </div>

            <div class="row mb-3">
                <div class="col">
                    <label class="fw-bold">Nombre:</label>
                    <p><%# Eval("Nombre") %></p>
                </div>

                <div class="col">
                    <label class="fw-bold">Apellido:</label>
                    <p><%# Eval("Apellido") %></p>
                </div>

                <div class="col">
                    <label class="fw-bold">Email:</label>
                    <p><%# Eval("Correo") %></p>
                </div>
            </div>

            <div class="row mb-3">
                <div class="col">
                    <label class="fw-bold">Barrio:</label>
                    <p><%# Eval("Barrio") %></p>
                </div>

                <div class="col">
                    <label class="fw-bold">Dirección:</label>
                    <p><%# Eval("Direccion") %></p>
                </div>

                <div class="col">
                    <label class="fw-bold">Celular:</label>
                    <p><%# Eval("Telefono") %></p>
                </div>
            </div>
        </div>

        <div class="card-footer text-center bg-dark border-light">
            <asp:Button Text="Volver" ID="btnVolver" runat="server" CssClass="btn btn-light" OnClick="btnVolver_Click" />
        </div>
    </div>
</div>


</asp:Content>
   