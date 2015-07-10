## SIDEBAR
sidebar <- dashboardSidebar(
    sidebarMenu(
        menuItem(
            "Upload",
            tabName = "upload",
            icon = icon("cloud-upload")
        ),
        menuItem(
            "Cluster",
            tabName = "cluster",
            icon = icon("line-chart")
        ),
        menuItem(
            "Acknowledgements",
            tabName = "acknowledgements",
            icon = icon("trophy")
        )
    )
)
