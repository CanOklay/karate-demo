package app.feature;


import com.intuit.karate.junit5.Karate;

class MyTestRunner {

    @Karate.Test
    Karate testAll() {
        return Karate.run().relativeTo(getClass());
    }

    @Karate.Test
    Karate testSample() {
        return Karate.run("MyTest").relativeTo(getClass());
    }

    @Karate.Test
    Karate testTags() {
        return Karate.run("MyTest").tags("@smoke").relativeTo(getClass());
    }

    @Karate.Test
    Karate testFullPath() {
        return Karate.run("classpath:examples/MyTest.app.feature").tags("@first");
    }

    @Karate.Test
    Karate testSystemProperty() {
        return Karate.run("classpath:examples/MyTest.app.feature")
                .tags("@smoke")
                .karateEnv("test")
                .systemProperty("foo", "bar");
    }
}