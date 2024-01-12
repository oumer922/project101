#!/bin/bash

# Address Book File
address_book_file="contacts.txt"

# Function to display the menu
display_menu() {
  clear
  echo "Address Book Menu:"
  echo "1. Add Contact"
  echo "2. View Contacts"
  echo "3. Search Contact"
  echo "4. Edit Contact"
  echo "5. Delete Contact"
  echo "6. Exit"
}

# Function to add a new contact
add_contact() {
  read -p "Enter name: " name
  read -p "Enter phone number: " phone
  read -p "Enter email: " email
  read -p "Enter address: " address
  echo "$name:$phone:$email:$address" >> "$address_book_file"
  echo "Contact added successfully."
}

# Function to view all contacts
view_contacts() {
  clear
  echo "List of Contacts:"
  echo "-----------------"
  cat "$address_book_file"
  read -n 1 -s -r -p "Press any key to continue..."
}

# Function to search for a contact
search_contact() {
  read -p "Enter name or phone number to search: " query
  clear
  echo "Search Results:"
  echo "---------------"
  grep -i "$query" "$address_book_file"
  read -n 1 -s -r -p "Press any key to continue..."
}

# Function to edit a contact
edit_contact() {
  read -p "Enter the name of the contact to edit: " name_to_edit
  temp_file="temp.txt"
  grep -i "$name_to_edit" "$address_book_file" > "$temp_file"
  if [ -s "$temp_file" ]; then
    clear
    echo "Current Contact Information:"
    echo "--------------------------"
    cat "$temp_file"
    echo "Enter new information:"
    read -p "Enter name: " name
    read -p "Enter phone number: " phone
    read -p "Enter email: " email
    read -p "Enter address: " address
    sed -i "/$name_to_edit/d" "$address_book_file"
    echo "$name:$phone:$email:$address" >> "$address_book_file"
    echo "Contact edited successfully."
  else
    echo "Contact not found."
  fi
  rm "$temp_file"
  read -n 1 -s -r -p "Press any key to continue..."
}

# Function to delete a contact
delete_contact() {
  read -p "Enter the name of the contact to delete: " name_to_delete
  temp_file="temp.txt"
  grep -i "$name_to_delete" "$address_book_file" > "$temp_file"
  if [ -s "$temp_file" ]; then
    clear
    echo "Contact to be deleted:"
    echo "----------------------"
    cat "$temp_file"
    read -p "Are you sure you want to delete this contact? (y/n): " confirm
    if [ "$confirm" == "y" ] || [ "$confirm" == "Y" ]; then
      sed -i "/$name_to_delete/d" "$address_book_file"
      echo "Contact deleted successfully."
    else
      echo "Contact not deleted."
    fi
  else
    echo "Contact not found."
  fi
  rm "$temp_file"
  read -n 1 -s -r -p "Press any key to continue..."
}

# Main program loop
while true; do
  display_menu
  read -p "Enter your choice: " choice
  case $choice in
    1) add_contact ;;
    2) view_contacts ;;
    3) search_contact ;;
    4) edit_contact ;;
    5) delete_contact ;;
    6) exit ;;
    *) echo "Invalid choice. Please try again." ;;
  esac
done