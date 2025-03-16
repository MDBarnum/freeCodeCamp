#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"
echo -e "\n~~~~~ MY SALON ~~~~~\n"

MAIN_MENU() {
  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi
  echo "Welcome to My Salon, how can I help you?"
  echo -e "\n1) Haircut"
  echo "2) Nails"
  echo "3) Perm"
  echo "4) Exit"
  read SERVICE_ID_SELECTED

  case $SERVICE_ID_SELECTED in
    1) MAKE_APPOINTMENT ;;
    2) MAKE_APPOINTMENT ;;
    3) MAKE_APPOINTMENT ;;
    4) EXIT ;;
    *) MAIN_MENU "I could not find that service. What would you like today?"
  esac
}

MAKE_APPOINTMENT() {
  # get customer phone number
  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE';")
  # if not found
  if [[ -z $CUSTOMER_ID ]]
  then
    # add customer information
    echo -e "\nI don't have a record for that number, what's your name?"
    read CUSTOMER_NAME
    FORMATTED_CUSTOMER_NAME=$(echo $CUSTOMER_NAME | sed 's/ |/"/')
    INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(name, phone) VALUES('$FORMATTED_CUSTOMER_NAME', '$CUSTOMER_PHONE');")
    # retrieve customer_id
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE';")
  fi
  # get service name
  SERVICE=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED;")
  FORMATTED_SERVICE=$(echo $SERVICE | sed 's/ |/"/')
  # get customer name
  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE customer_id=$CUSTOMER_ID;")
  FORMATTED_CUSTOMER_NAME=$(echo $CUSTOMER_NAME | sed 's/ |/"/')
  # get appointment time
  echo -e "\nWhat time would you like your $FORMATTED_SERVICE, $FORMATTED_CUSTOMER_NAME?"
  read SERVICE_TIME 
  # create appointment
  CREATE_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME');")
  # confirm appointment
  FORMATTED_SERVICE_TIME=$(echo $SERVICE_TIME | sed 's/ |/"/')
  echo -e "\nI have put you down for a $FORMATTED_SERVICE at $FORMATTED_SERVICE_TIME, $FORMATTED_CUSTOMER_NAME."
  # return to main menu
  
}

EXIT() {
  echo "Thanks for coming. Good-bye."
}

MAIN_MENU