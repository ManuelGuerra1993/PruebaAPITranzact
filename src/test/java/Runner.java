import com.intuit.karate.junit4.Karate;
import cucumber.api.CucumberOptions;
import org.junit.runner.RunWith;

//Ejecución con Karate
@RunWith(Karate.class)
//features obtiene la ruta de los casos
//tags se selecciona si se ejecuta uno o todos segun la etiqueta que se ingrese
@CucumberOptions(features = "src/test/java",tags = "@Tranzact")

public class Runner {
}
