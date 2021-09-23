using System;
using System.Threading;

namespace Lab04_Concurrency
{
    // Inspect resource sharing amoung threads
    public class Experiment_02
    {
        private static int resource = 10000;

        private static void TestThread1()
        {
            for (int i = 0; i < 10000; i++)
            {
                Console.WriteLine("Thread# 1 resource = {0}", resource);
            }
        }

        private static void TestThread2()
        {
            for (int i = 0; i < 10000; i++)
            {
                Console.WriteLine("Thread# 2 resource = {0}", resource);
            }
        }

        public static void Run()
        {
            Thread thread1 = new Thread(TestThread1);
            Thread thread2 = new Thread(TestThread2);

            thread1.Start();
            thread2.Start();
        }
    }
}
