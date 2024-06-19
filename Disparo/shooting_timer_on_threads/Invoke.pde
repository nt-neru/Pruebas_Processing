import java.util.concurrent.*;

public static class Invoke {
    private static final ScheduledExecutorService executor = Executors.newSingleThreadScheduledExecutor(new ThreadFactory() {
        public Thread newThread(Runnable r) {
            Thread thread = new Thread(r);
            thread.setName("ScheduledExecutorThread");
            return thread; // hilo
        }
    });
    
    // puede usarse este tambien para no asignar un nombre 
    // private static final ScheduledExecutorService executor = Executors.newScheduledThreadPool(1);

    public static void schedule(Runnable metod, long delay, TimeUnit unit) {
        executor.schedule(metod, delay, unit);
    }
}
