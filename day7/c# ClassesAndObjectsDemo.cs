using System;
using System.Collections.Generic;
using System.Text;

namespace ClassAndObjectDemo
{
    internal class Employee
    {
        private int employeeId;
        private String employeeName;
        private String email;
        private long employeeContact;


        // Properties
        public int EmployeeId
        {
            set{ employeeId = value;}
            get { return employeeId; }
        }
        public String EmployeeName
        {
            set { employeeName = value; }
            get { return employeeName; }
        }
        public String Email
        {
              set { email = value; }    
            get { return email; }
        }
        public long Contact
        {
            set { employeeContact=value; }
            get { return employeeContact; }
        }

        public void PrintDetails()
        {
            Console.WriteLine(this.employeeId);
            Console.WriteLine(this.employeeName);
            Console.WriteLine(this.email);
            Console.WriteLine(this.employeeContact);
        }

    }
}
