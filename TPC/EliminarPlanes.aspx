<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EliminarPlanes.aspx.cs" Inherits="TPC.EliminarPlanes" %>

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
                            <h4>Membresía </h4>
                        </div>
                        <div class="card-body bg-dark text-light">
                            <asp:DropDownList ID="ddlMembresia" AutoPostBack="true" OnSelectedIndexChanged="ddlMembresia_SelectedIndexChanged" AppendDataBoundItems="true" runat="server" CssClass="form-select bg-dark text-light select-largo" Style="font-size: 1.2rem; padding: 0.75rem;" aria-label="Tipo de membresía">
                                <asp:ListItem Value="">Tipo de membresía</asp:ListItem>
                            </asp:DropDownList>
                            <br />
                            <asp:Button Text="Eliminar" ID="btnEliminarMembresía" runat="server" CssClass="btn btn-danger"  OnClick="btnEliminarMembresía_Click"/>
                            <asp:Button Text="Modificar" ID="btnModificarMembresía" runat="server" CssClass="btn btn-success"  OnClick="btnModificarMembresía_Click"/>
                        </div>
                    </div>
                </div>

                <!-- Tarjeta 2: Membresía Premium -->
                <div class="col-md-4 mb-3">
                    <div class="card text-center shadow-lg border-warning">
                        <div class="card-header bg-warning text-dark">
                            <h4> Actividades</h4>
                        </div>
                        <div class="card-body bg-dark text-light">
                            <asp:DropDownList ID="ddlActividadExtra" AutoPostBack="true" OnSelectedIndexChanged="ddlActividadExtra_SelectedIndexChanged" AppendDataBoundItems="true" runat="server" CssClass="form-select bg-dark text-light select-largo" Style="font-size: 1.2rem; padding: 0.75rem;" aria-label="Sumar actividad extra">
                                <asp:ListItem Value="">Tipo de membresía</asp:ListItem>
                            </asp:DropDownList>
                            <br />
                            <asp:Button Text="Eliminar" ID="btnEliminarActividades" runat="server" CssClass="btn btn-danger"  OnClick="btnEliminarActividades_Click"/>
                            <asp:Button Text="Modificar" ID="btnModificarActividades" runat="server" CssClass="btn btn-success" OnClick="btnModificarActividades_Click"/>
                        </div>
                    </div>
                </div>
            </div>
            <div class="text-center">

                <asp:Button Text="Cancelar" ID="btnCancelar" runat="server" CssClass="btn btn-danger" OnClick="btnCancelar_Click" />
            </div>


        </div>
    </div>
    <asp:Label ID="lbl" CssClass="bg-danger" runat="server" />
</asp:Content>
