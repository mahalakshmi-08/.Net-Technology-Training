using System;

namespace StarterApplication
{
    internal class Program
    {
        static void Main(string[] args)
        {
            // IO Statements
            Console.Write("Welcome to C# Learning\n");

            Console.WriteLine("Happy Learnings ");

            int x = 10;// static data or hard-coded data
            int y = 20;
            Console.WriteLine(x + y);

            // Dynamic values for variables
            int a;
            int b;

            // from the console when we read data that will be string

            //int= string -> error

            Console.WriteLine("Enter the a value");
            a = int.Parse(Console.ReadLine());
            Console.WriteLine("Enter the b value");
            b =int.Parse(Console.ReadLine());
            Console.WriteLine("Sum : "+(a+b));


        }
    }
}
