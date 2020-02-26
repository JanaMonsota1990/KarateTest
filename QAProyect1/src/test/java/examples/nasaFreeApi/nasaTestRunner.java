package examples.nasaFreeApi;

import com.intuit.karate.junit5.Karate;

class nasaTestRunner {
    @Karate.Test
    Karate nasaTest() {
        return Karate.run("nasaTest").relativeTo(getClass());
    }
}
