using System;
using System.Threading;

namespace Lab04_Concurrency
{
    // Pause main thread and wait for thread1 done
    public class Experiment_03_02
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
            thread1.Join(); // Pause current thread and wait for thread1 done

            Console.WriteLine("resource = {0}", resource);
        }
    }
}
