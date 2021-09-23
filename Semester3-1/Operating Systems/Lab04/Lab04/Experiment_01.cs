using System;
using System.Threading;

namespace Lab04_Concurrency
{
    // Inspect thread behavior
    public class Experiment_01
    {
        private static void TestThread1()
        {
            for(int i=0; i < 10000; i++)
            {
                Console.WriteLine("Thread# 1 i = {0}", i);
            }
        }

        private static void TestThread2()
        {
            for (int i = 0; i < 10000; i++)
            {
                Console.WriteLine("Thread# 2 i = {0}", i);
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
