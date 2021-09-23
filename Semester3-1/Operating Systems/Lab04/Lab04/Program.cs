using System;

namespace Lab04_Concurrency
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("# Select below experiment number #\n");
            Console.WriteLine("1 : Experiment_01");
            Console.WriteLine("2 : Experiment_02");
            Console.WriteLine("3 : Experiment_03_00");
            Console.WriteLine("4 : Experiment_03_01");
            Console.WriteLine("5 : Experiment_03_02");

            Console.Write("\nType your choice : ");
            char input = Console.ReadLine()[0];

            Console.WriteLine("\n========== Result ==========\n");

            if (input == '1')
            {
                Experiment_01.Run();
            }
            else if (input == '2')
            {
                Experiment_02.Run();
            }
            else if (input == '3')
            {
                Experiment_03_00.Run();
            }
            else if (input == '4')
            {
                Experiment_03_01.Run();
            }
            else if (input == '5')
            {
                Experiment_03_02.Run();
            }
        }
    }
}
