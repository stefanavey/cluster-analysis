header <- dashboardHeader(
    title = "Sparse Data Parser",
    ## MESSAGES
    dropdownMenu(
        type = "messages",
        messageItem(
            from = "Sparse Data",
            message = "Welcome to our app!"
        ),
        messageItem(
            from = "FAQ",
            message = "Frequently Asked Questions",
            icon = icon("question"),
            time = "13:45"
        ),
        messageItem(
            from = "Support",
            message = "Find answers here.",
            icon = icon("life-ring"),
            time = "2014-12-01"
        )
    ),
    ## NOTIFICATIONS
    dropdownMenu(
        type = "notifications",
        notificationItem(
            text = "Your first analysis!",
            icon("users")
        ),
        notificationItem(
            text = "1 analysis delivered",
            icon("truck"),
            status = "success"
        ),
        notificationItem(
            text = "We are at 70% capacity!",
            icon = icon("exclamation-triangle"),
            status = "warning"
        )
    ),
    ## TASKS
    dropdownMenu(
        type = "tasks",
        badgeStatus = "success",
        taskItem(
            value = 90, color = "green",
            "Documentation"
        ),
        taskItem(
            value = 17, color = "aqua",
            "Project X"
        ),
        taskItem(
            value = 75, color = "yellow",
            "Server deployment"
        ),
        taskItem(
            value = 80, color = "red",
            "Overall project"
        )
    )
)



