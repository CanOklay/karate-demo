package app.feature;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import cucumber.api.java.After;
import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;
import org.apache.commons.io.FileUtils;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

public class AppTest {

    @Test
    void testParallel() {
        Results results = Runner.path("classpath:app/feature/MyTest.feature")
                .outputCucumberJson(true)
                .parallel(5);
        Assertions.assertTrue(results.getFailCount() == 0, results.getErrorMessages());
    }

    @After
    public static void generateReport(String karateOutputPath) {
        Collection<File> jsonFiles = FileUtils.listFiles(new File(karateOutputPath), new String[] {"json"}, true);
        List<String> jsonPaths = new ArrayList<>(jsonFiles.size());
        jsonFiles.forEach(file -> jsonPaths.add(file.getAbsolutePath()));
        Configuration config = new Configuration(new File("target"), "app");
        ReportBuilder reportBuilder = new ReportBuilder(jsonPaths, config);
        reportBuilder.generateReports();
    }
}
