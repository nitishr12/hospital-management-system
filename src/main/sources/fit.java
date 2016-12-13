/**
 * Auto Generated Java Class.
 */
import jxl.*;
import javafx.application.Application;
import javafx.scene.Scene;
import javafx.scene.chart.BarChart;
import javafx.scene.chart.CategoryAxis;
import javafx.scene.chart.LineChart;
import javafx.scene.chart.NumberAxis;
import javafx.scene.chart.XYChart;
import javafx.stage.Stage;  

import java.io.*;
import java.util.*;
public class fit extends Application{
 
static ArrayList<Dataset> set;
 @Override public void start(Stage stage) {
        stage.setTitle("Bar Chart Sample");
        final CategoryAxis xAxis = new CategoryAxis();
        final NumberAxis yAxis = new NumberAxis();
        final BarChart<String,Number> bc = 
            new BarChart<String,Number>(xAxis,yAxis);
        bc.setTitle("Room Fit Percentage");
        xAxis.setLabel("Room");       
        yAxis.setLabel("Fit");
		XYChart.Series<String,Number> series1 = new XYChart.Series<String,Number>();
        series1.setName("First Floor");  
        System.out.println(set.size());
        for(int i=0;i<set.size();i++){
        series1.getData().add(new XYChart.Data<String, Number>(Integer.toString(set.get(i).room), set.get(i).match*100));
        } 
        Scene scene  = new Scene(bc,800,600);
        bc.getData().add(series1);
        stage.setScene(scene);
        stage.show();
 }
 public static ArrayList<Dataset> bayesian(ArrayList<Dataset> list,int param,String request){
  System.out.println("in");
	for(int i=0;i<list.size();i++){
    int param1=0;
   if(list.get(i).desc.contains(request))
     param1++;
   list.get(i).match=param1/param;
   System.out.println(list.get(i).room+" "+list.get(i).desc+" "+list.get(i).match);
  }
  return list;
 }
 public static void main(String[]args){
  int parameters=1;
  Workbook wb=null;
     Sheet st=null;
     Cell c=null;
     int i=0;
     ArrayList<Dataset>sets=new ArrayList<Dataset>();
  while(true){
   try{
    wb=Workbook.getWorkbook(new File("C:/Users/S_Chaitu/workspace_SSDI_project/SpringMVCHibernate/src/main/source/DataSet.xls"));
    st=wb.getSheet("Sheet1");
    Dataset obj=new Dataset();
    c=st.getCell(0, i);
    obj.room=Integer.parseInt(c.getContents());
    c=st.getCell(1,i);
    obj.desc=c.getContents();
    i+=1;
    sets.add(obj);
   }
   catch(Exception e){
    break;
   }
  }
  System.out.println(sets.size());
  /*for (i=0;i<count;i++){
   System.out.println(set.get(i).room+" "+set.get(i).desc);
  }*/
  sets=bayesian(sets,parameters,"Cardiology");
  set=sets;
  System.out.println(set.size()+parameters);
  Application.launch(args);
   
  /*for(i=0;i<set.size();i++){
   try{
   wb.close();
   WritableWorkbook ww=Workbook.createWorkbook(new File("DataSet1.xls"));
   WritableSheet ws=ww.getSheet("Sheet1");
   WritableCell wc=ws.getWritableCell(0, i);
   Label l=(Label) wc;
   l.setString(Integer.toString(set.get(i).room));
   ww.write();
   wc=ws.getWritableCell(1, i);
   if (wc.getType() == CellType.LABEL) { 
    l=(Label) wc;
    l.setString(set.get(i).desc);
    wc=ws.getWritableCell(2, i);
    l=(Label) wc;
    l.setString(Integer.toString(set.get(i).match));
   }
   ww.write();
   ww.write();
   ww.close();
   }
   catch(Exception e){}
  }*/
 }
}
