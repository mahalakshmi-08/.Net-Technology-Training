using System;

namespace LoopingStatementsDemo
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("A Calculcator");
            Console.WriteLine("Enter the number for operation");
            char option;
            int number1 = int.Parse(Console.ReadLine());
            int number2 = int.Parse(Console.ReadLine());
            do
            {
                Console.WriteLine("Enter 1--> Addition\n 2-->Subtraction \n 3--> Multi \n 4--> Div \n 0--> For Exit :) ");
                int choice=int.Parse(Console.ReadLine());
                switch (choice)
                {
                    case 1:
                        Console.WriteLine("Added value :" + (number1 + number2));
                        break;
                    case 2: Console.WriteLine("Subtracted value :" + (number1 - number2));
                        break;
                    case 3: Console.WriteLine("Multiplied Values :" + (number1 * number2));
                        break;
                    case 4:
                        Console.WriteLine("Divided value : " + (number1 / number2));
                        break;
                    
                        

                }
                Console.WriteLine("Do you want to continue (y/n) ");
                option = char.Parse(Console.ReadLine());
            }while((option=='Y') || (option=='y'));

        }
    }
}
