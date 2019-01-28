/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ayuda;

import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

/**
 *
 * @author alumno_2DAW
 */
public class Ayudante {
    
    Session session=null;

    public Ayudante() {
        
        SessionFactory sessionFactory=NewHibernateUtil.getSessionFactory();
        this.session=sessionFactory.openSession();
        org.hibernate.Transaction tx=session.beginTransaction();
                
    }
    
    public List<Store>consultaTienda(){
        List<Store>lista;
        
        Query q=session.createQuery("from Store as s");
        lista=(List<Store>)q.list();
        
        return lista;
    }

    public List<Category>consultaCategoria(){
        List<Category>lista;
        
        Query q=session.createQuery("from Category as c");
        lista=(List<Category>)q.list();
        
        return lista;
    }
    
    public List<Category>consultaCategori(int num){
        List<Category>lista;
        
        Query q=session.createQuery("from Category as c where c.categoryId="+num+"");
        lista=(List<Category>)q.list();
        
        return lista;
    }
    
    public List consultaDatos(int id){
        List<Store>lista;
        
        Query q=session.createQuery("from Store as s where s.storeId="+id+"");
        lista=(List<Store>)q.list();
        
        return lista;
    }
    
    public List consultaEmpleado(int id){
        List<Staff>lista;
        
        Query q=session.createQuery("from Staff as s where s.staffId="+id+"");
        lista=(List<Staff>)q.list();
        
        return lista;
    }
    
    public List consultaClientesActivos(int id){
        List<Customer>lista;
        
        Query q=session.createQuery("from Customer as c where c.store="+id+"");
        lista=(List<Customer>)q.list();
        
        return lista;
    }
    
    public List consultaPelis(int id){
        List<Film>lista;
        
        Query q=session.createQuery("select p.title from Film as p,FilmCategory as fc where fc.film=p.filmId and fc.category="+id+"");
        lista=(List<Film>)q.list();
        
        return lista;
    }
    
    public List<Film>consultaDatosPeli(String titulo){
        List<Film>lista;
        
        Query q=session.createQuery("from Film as f where f.title='"+titulo+"'");
        lista=(List<Film>)q.list();
        
        return lista;
    }
    
}
