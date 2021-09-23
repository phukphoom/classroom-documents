using System;
using System.Threading;

namespace Lab04_Concurrency
{
    // Pause main thread for 10 ms.
    public class Experiment_03_01
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
            Thread.Sleep(10); // Pause current thread for 10 ms.

            Console.WriteLine("resource = {0}", resource);
        }
    }
}
