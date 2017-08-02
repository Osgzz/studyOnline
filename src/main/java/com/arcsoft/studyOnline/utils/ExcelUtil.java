package com.arcsoft.studyOnline.utils;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.apache.xmlbeans.impl.piccolo.io.FileFormatException;

import java.io.*;

public class ExcelUtil {

    private static final String EXTENSION_XLS = "xls";
    private static final String EXTENSION_XLSX = "xlsx";

    /*** 
          * <pre> 
          * 取得Workbook对象(xls和xlsx对象不同,不过都是Workbook的实现类) 
          *   xls:HSSFWorkbook 
          *   xlsx：XSSFWorkbook 
          * @param filePath 
          * @return 
          * @throws IOException 
          * </pre> 
     */
    public Workbook getWorkbook(String filePath){
        Workbook workbook = null;
        InputStream is;
        try {
            is=new FileInputStream(filePath);
            if(filePath.endsWith(EXTENSION_XLS)){
                workbook = new HSSFWorkbook(is);
            }else if(filePath.endsWith(EXTENSION_XLSX)){
                workbook = new XSSFWorkbook(is);
            }
        }catch (FileNotFoundException e){
            e.printStackTrace();
        }catch (IOException e){
            e.printStackTrace();
        }
        return workbook;
    }

    /** 
          * 文件检查 
          * @param filePath 
          * @throws FileNotFoundException 
          * @throws FileFormatException 
     */

    private void preReadCheck(String filePath) throws FileNotFoundException, FileFormatException {
        File file = new File(filePath);
        if(!file.exists()){
            throw new FileNotFoundException("传入的文件不存在："+filePath);
        }

        if(!(filePath.endsWith(EXTENSION_XLS)||filePath.endsWith(EXTENSION_XLSX))){
            throw new FileFormatException("传入的文件不是excel");
        }
    }

    /** 
          * 读取excel文件内容 
          * @param filePath 
          * @throws FileNotFoundException 
          * @throws FileFormatException 
      */

    public void readExcel(String filePath) throws FileNotFoundException, FileFormatException {
        preReadCheck(filePath);
    }

    /** 
          * 取单元格的值 
          * @param cell 单元格对象 
          * @param treatAsStr 为true时，当做文本来取值 (取到的是文本，不会把“1”取成“1.0”) 
          * @return 
     */
    public String getCellValue(Cell cell, boolean treatAsStr){
        if(cell == null){
            return "";
        }
        if(treatAsStr){
            cell.setCellType(Cell.CELL_TYPE_STRING);
        }
        if(cell.getCellType() == Cell.CELL_TYPE_BOOLEAN){
            return String.valueOf(cell.getBooleanCellValue());
        }else if(cell.getCellType() == Cell.CELL_TYPE_NUMERIC){
            return String.valueOf(cell.getNumericCellValue());
        }else {
            return String.valueOf(cell.getStringCellValue());
        }
    }

}

