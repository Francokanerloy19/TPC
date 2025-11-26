<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ConfirmarAccion.aspx.cs" Inherits="TPC.ConfirmarAccion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <style>
        .centrar-vertical {
            min-height: 80vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }
    </style>

    <div class="centrar-vertical">
        <div class="container">
            <h2 class="text-center mb-5 text-white">Confirmar Acción</h2>

            <div class="row justify-content-center">
                <div class="col-md-8 col-lg-6">

                    <div class="card text-center shadow-lg border-success">

                        <div class="card-header bg-success text-white py-3">
                            <h4 class="mb-0">¿Estás seguro que deseas continuar?</h4>
                        </div>

                        <div class="card-body bg-dark text-light p-5">

                            <div class="mb-4 text-center">
                                <asp:Label ID="lblDescripcion" runat="server" CssClass="form-label d-block mb-3 fs-5 text-white" Text="Motivo (opcional)"> </asp:Label>

                                <div class="d-flex justify-content-center">
                                    <asp:TextBox ID="txtDescripcion" runat="server" TextMode="MultiLine" Rows="5" CssClass="form-control form-control-lg w-75" placeholder="Ingrese el motivo de la acción..."> </asp:TextBox>
                                </div>
                            </div>

                            <div class="d-flex justify-content-center gap-3 mt-4">
                                <asp:Button Text="Confirmar" ID="btnEliminarAccion" runat="server" CssClass="btn btn-danger btn-lg px-4"  OnClick="btnEliminarAccion_Click"/>

                                <asp:Button Text="Cancelar" ID="btnCancelar" runat="server" CssClass="btn btn-secondary btn-lg px-4"  OnClick="btnCancelar_Click"/>
                            </div>

                        </div>
                    </div>

                </div>
            </div>

        </div>
    </div>

</asp:Content>
