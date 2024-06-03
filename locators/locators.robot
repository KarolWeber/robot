*** Variables ***
# Login page
${LOGIN_ID}      id:login_id
${ERROR_LOGIN_ID}      id:error_login_id
${LOGIN_PASSWORD}      id:login_password
${ERROR_LOGIN_PASSWORD}      id:error_login_password
${LOGIN_BUTTON}     id:login-btn
${USER_NAME}        id:user_name

# Dashboard
${DASHBOARD_QUICK_PAYMENT_RECIEVER}    id:widget_1_transfer_receiver
${DASHBOARD_QUICK_PAYMENT_AMOUNT}    id:widget_1_transfer_amount
${DASHBOARD_QUICK_PAYMENT_TITLE}    id:widget_1_transfer_title
${DASHBOARD_QUICK_PAYMENT_EXECUTE_BUTTON}    id:execute_btn

${DASHBOARD_TOP_UP_PHONE_RECIEVER}    id:widget_1_topup_receiver
${DASHBOARD_TOP_UP_PHONE_AMOUNT}    id:widget_1_topup_amount
${DASHBOARD_TOP_UP_PHONE_CHECKBOX}    id:widget_1_topup_agreement
${DASHBOARD_TOP_UP_PHONE_EXECUTE_BUTTON}    id:execute_phone_btn



${DASHBOARD_CLOSE_BUTTON}    css:[data-testid='close-button']
${DASHBOARD_USER_MESSAGES}    id:user_messages

# Side menu
${SIDE_MENU_PAYMENTS}    id:payments_btn