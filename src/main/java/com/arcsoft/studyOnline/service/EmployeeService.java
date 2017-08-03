package com.arcsoft.studyOnline.service;

import com.arcsoft.studyOnline.bean.Department;
import com.arcsoft.studyOnline.bean.Employee;
import com.arcsoft.studyOnline.bean.EmployeeWithDeptNameAndPositon;
import com.arcsoft.studyOnline.bean.Position;
import com.arcsoft.studyOnline.dao.DepartmentMapper;
import com.arcsoft.studyOnline.dao.EmployeeMapper;
import com.arcsoft.studyOnline.dao.PositionMapper;

import com.arcsoft.studyOnline.utils.ExcelUtil;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.xmlbeans.impl.piccolo.io.FileFormatException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.FileNotFoundException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * Created by Focus on 2017/6/21.
 */
@Service
public class EmployeeService {
    @Autowired
    private EmployeeMapper employeeMapper;
    @Autowired
    private  DepartmentMapper departmentMapper;
    @Autowired
    private PositionMapper positionMapper;

    public Employee getEmployeeByUsername(String username) {
        return employeeMapper.selectEmployeeByUsername(username);
    }

    public List<Employee> selectEmployeeList(){
        return employeeMapper.selectEmployeeList();
    }

    public void  insertEmployee(Integer departmentId,Integer positionId,String employeeName,String employeeNickname,String employeePassword,String employeeGender,String employeePhone,String employeeMail,HttpServletRequest request){
        ApplicationContext applicationContext = new ClassPathXmlApplicationContext("applicationContext.xml");
        Employee employee = (Employee) applicationContext.getBean("employee");
        employee.setDeptId(departmentId);
        employee.setPositionId(positionId);
        employee.setName(employeeName);
        employee.setNickname(employeeNickname);
        employee.setPassword(employeePassword);
        employee.setGender(employeeGender);
        employee.setPhone(employeePhone);
        employee.setEmail(employeeMail);
        employeeMapper.insertEmployee(employee);
    }

    public Employee selectEmployeeById(Integer id){
        return employeeMapper.selectEmployeeById(id);
    }

    public void updateEmployee(Integer id,String employeeName,String employeeNickname,String employeePassword,String employeeGender,Integer departmentId,Integer positionId,String employeePhone,String employeeMail,HttpServletRequest request){
        ApplicationContext applicationContext = new ClassPathXmlApplicationContext("applicationContext.xml");
        Employee employee = (Employee) applicationContext.getBean("employee");
        employee.setId(id);
        employee.setName(employeeName);
        employee.setNickname(employeeNickname);
        employee.setPassword(employeePassword);
        employee.setGender(employeeGender);
        employee.setDeptId(departmentId);
        employee.setPositionId(positionId);
        employee.setPhone(employeePhone);
        employee.setEmail(employeeMail);
        employeeMapper.updateEmployee(employee);
    }

    public void delEmployee(Integer id){
        employeeMapper.delEmployee(id);
    }

    public void updateEmployeePassword(Integer id,String password){
        ApplicationContext applicationContext = new ClassPathXmlApplicationContext("applicationContext.xml");
        Employee employee = (Employee) applicationContext.getBean("employee");
        employee.setId(id);
        employee.setPassword(password);
        employeeMapper.updateEmployeePassword(employee);
    }

    public void updateEmployeeInfo(Integer id,String name,String nickname,String gender,Integer department,Integer position,String phone,String email,HttpServletRequest request){
        ApplicationContext applicationContext = new ClassPathXmlApplicationContext("applicationContext.xml");
        Employee employee = (Employee) applicationContext.getBean("employee");
        employee.setId(id);
        employee.setName(name);
        employee.setNickname(nickname);
        employee.setGender(gender);
        employee.setDeptId(department);
        employee.setPositionId(position);
        employee.setPhone(phone);
        employee.setEmail(email);
        employeeMapper.updateEmployeeInfo(employee);
    }


    public void employeeListByExcel(MultipartFile excel,HttpServletRequest request){

        Date date = null;
        String cover = "";
        String excelPath = "";

        ExcelUtil excelUtil = new ExcelUtil();

        if(!excel.isEmpty()){
            try {
                date = new Date();
                SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddhhmmss");
                cover = sdf.format(date);

                // 文件保存路径
                excelPath = request.getSession().getServletContext().getRealPath("/") + "excels\\"
                        + cover + "." + excel.getOriginalFilename().split("\\.")[1];
                System.out.println("excel的保存路径:" + excelPath);
                // 转存文件
                excel.transferTo(new File(excelPath));

                excelUtil.readExcel(excelPath);
                getAllByExcel(excelPath);
            } catch (FileNotFoundException e) {
                e.printStackTrace();
            } catch (FileFormatException e){
                e.printStackTrace();
            }catch (Exception e){
                e.printStackTrace();
            }
        }
    }

    public void getAllByExcel(String filePath){

        List<Department> departmentList = departmentMapper.selectDepartmentList();
        List<Position> positionList = positionMapper.selectPositionList();

        ExcelUtil excelUtil = new ExcelUtil();

        ApplicationContext applicationContext = new ClassPathXmlApplicationContext("applicationContext.xml");
        Employee employee = (Employee) applicationContext.getBean("employee");

        try {
            Workbook workbook = excelUtil.getWorkbook(filePath);
            for(int numSheet=0;numSheet<workbook.getNumberOfSheets();numSheet++){
                Sheet sheet = workbook.getSheetAt(numSheet);
                if(sheet == null){
                    break;
                }

                int firstRowIndex = sheet.getFirstRowNum();
                int lastRowIndex = sheet.getLastRowNum();

                for(int rowIndex = firstRowIndex+1; rowIndex<=lastRowIndex; rowIndex++){
                    Row currentRow = sheet.getRow(rowIndex);

                    int firstColumnIndex = currentRow.getFirstCellNum();
                    int lastColumnIndex = currentRow.getLastCellNum();

                    for(int columnIndex = firstColumnIndex; columnIndex<lastColumnIndex; columnIndex++) {

                        String name = excelUtil.getCellValue(currentRow.getCell(columnIndex++), true);
                        String nickname = excelUtil.getCellValue(currentRow.getCell(columnIndex++), true);
                        String password = excelUtil.getCellValue(currentRow.getCell(columnIndex++), true);
                        String gender = excelUtil.getCellValue(currentRow.getCell(columnIndex++), true);
                        String department = excelUtil.getCellValue(currentRow.getCell(columnIndex++), true);
                        String posit = excelUtil.getCellValue(currentRow.getCell(columnIndex++), true);
                        String phone = excelUtil.getCellValue(currentRow.getCell(columnIndex++), true);
                        String email = excelUtil.getCellValue(currentRow.getCell(columnIndex++), true);

                        Integer deptId = null;
                        for (Department dept : departmentList) {
                            if (department.equals(dept.getName())) {
                                deptId = dept.getId();
                            }
                        }

                        Integer positionId = null;
                        for (Position position : positionList) {
                            if (posit.equals(position.getName())) {
                                positionId = position.getId();
                            }
                        }

                        employee.setName(name);
                        employee.setNickname(nickname);
                        employee.setPassword(password);
                        employee.setGender(gender);
                        employee.setDeptId(deptId);
                        employee.setPositionId(positionId);
                        employee.setPhone(phone);
                        employee.setEmail(email);

                        Integer count = employeeMapper.selectEmployeeCount(name);
                        if(count==0) {
                            employeeMapper.insertEmployee(employee);
                        }
                    }
                }
            }
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public List<EmployeeWithDeptNameAndPositon> selectEmployeeWithDeptAndPositon() {
        return  employeeMapper.selectEDP();
    }

    public Employee selectEmployeeByName(String name) {
        return employeeMapper.selectEmployeeByName(name);
    }
}
