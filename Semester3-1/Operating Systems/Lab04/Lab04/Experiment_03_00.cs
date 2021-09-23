using System;
using System.Threading;

namespace Lab04_Concurrency
{
    public class Experiment_03_00
    {
        private static int resource = 10000;

        private static void TestThread()
        {
            for (int i = 0; i < 1000; i++)
            {
                resource++;
                Console.Write(".");
            }
        }

        public static void Run()
        {
            Thread thread1 = new Thread(TestThread);

            thread1.Start();

            Console.WriteLine("resource = {0}", resource);
        }
    }
}
