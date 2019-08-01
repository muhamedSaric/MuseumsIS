package dao;

import entity.*;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;

public class MuseumRepository {

    private Session session = null;
    
    public MuseumRepository(){
           session = HibernateUtil.getSessionFactory().openSession();
    }

    public List<Museum> loadMuseums() {        
        return session.createCriteria(Museum.class).list();
    }

    public Museum getById(Integer id) {
        return (Museum) session.get(Museum.class, id);
    }

    public void saveMuseum(Museum museum) {
        try {
            session.beginTransaction();
            session.saveOrUpdate(museum);
            session.getTransaction().commit();
        } catch (HibernateException e) {
            throw new RuntimeException(e.getMessage());
        }
    }
    
    public void saveUser(User user) {
        try {
            session.beginTransaction();
            session.save(user);
            session.getTransaction().commit();
        } catch (HibernateException e) {
            throw new RuntimeException(e.getMessage());
        }
    }
    
    public List<City> LoadCities(){
        return session.createCriteria(City.class).list();
    }
    
    public List<Museumtpye> LoadTypes(){
        return session.createCriteria(Museumtpye.class).list();
    }

    public List<Museum> searchMuseumsByCityAndType(int city, int type) {
        
        Criteria crit = session.createCriteria(Museum.class);
        
        
        if(city >0)
       crit.add(Restrictions.eq("city.id",city));
        
        if(type>0)
       crit.add(Restrictions.eq("museumtpye.id",type));
        
       return  crit.list();

    }
    
     public List<Museum> searchMuseumsByName(String mq){
        Criteria crit = session.createCriteria(Museum.class);
        
        if(mq!=null && mq.length()>0)
       crit.add(Restrictions.like("name",mq, MatchMode.ANYWHERE));
        
       return  crit.list();
     }
     
     public User getUserByEmail(String email){
      Criteria crit = session.createCriteria(User.class);
        
       crit.add(Restrictions.like("email",email, MatchMode.EXACT));
        
       User user =  (User)crit.uniqueResult();
       return user;
     }
}
