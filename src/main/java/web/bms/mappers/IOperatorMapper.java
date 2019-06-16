package web.bms.mappers;
 
import java.util.List;

import web.bms.entity.Operator;
 
public interface IOperatorMapper {
 
    public int create(Operator operator);  
       
      
    public void delete(int id);  
       
      
    public Operator get(int id);  
     
      
    public void update(Operator operator);   
       
      
    public List<Operator> getAll();
      
}