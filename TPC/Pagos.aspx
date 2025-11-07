<%@ Page Title="Pagos" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Pagos.aspx.cs" Inherits="TPC.Pagos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .select-largo {
            font-size: 1.25rem;
            padding: 0.8rem 1rem;
            min-height: 50px;
        }

        .centrar-vertical {
            min-height: 70vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }
    </style>

    <div class="centrar-vertical">
        <div class="container mt-5">
            <h2 class="text-center mb-4">Seleccionar plan</h2>

            <div class="row justify-content-center">
                <!-- Tarjeta 1: Membresía básica -->
                <div class="col-md-4 mb-3">
                    <div class="card text-center shadow-lg border-success">
                        <div class="card-header bg-success text-white">
                            <h4>Membresía Básica</h4>
                        </div>
                        <div class="card-body bg-dark text-light">
                            <select class="form-select  bg-dark text-light select-largo" style="font-size: 1.2rem; padding: 0.75rem;" aria-label="Tipo de membresía">
                                <option selected>Tipo de membresia</option>
                                <option value="1">One</option>
                                <option value="2">Two</option>
                                <option value="3">Three</option>
                            </select>
                        </div>
                    </div>
                </div>

                <!-- Tarjeta 2: Membresía Premium -->
                <div class="col-md-4 mb-3">
                    <div class="card text-center shadow-lg border-warning">
                        <div class="card-header bg-warning text-dark">
                            <h4>Sumar Actividades</h4>
                        </div>
                        <div class="card-body bg-dark text-light">
                            <select class="form-select  bg-dark text-light select-largo" style="font-size: 1.2rem; padding: 0.75rem;" aria-label="Tipo de membresía">
                                <option selected>Tipo de membresia</option>
                                <option value="1">One</option>
                                <option value="2">Two</option>
                                <option value="3">Three</option>
                            </select>
                        </div>
                    </div>
                </div>
            </div>
            <div class="text-center">
                <asp:Button Text="Continuar" ID="btnContinuar" runat="server" CssClass="btn btn-success me-2" />
                <asp:Button Text="Cancelar" ID="btnCancelar" runat="server" CssClass="btn btn-danger" />
            </div>


        </div>
    </div>
</asp:Content>
