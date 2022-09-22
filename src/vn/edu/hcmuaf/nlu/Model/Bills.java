package vn.edu.hcmuaf.nlu.Model;

public class Bills {
    private int id;
    private  int id_customer;
    private String date_oder;
    private String toltal;
    private String payment;
    private  String note;

    public Bills(int id, int id_customer, String date_oder, String toltal, String payment, String note) {
        this.id = id;
        this.id_customer = id_customer;
        this.date_oder = date_oder;
        this.toltal = toltal;
        this.payment = payment;
        this.note = note;
    }

    public Bills() {

    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getId_customer() {
        return id_customer;
    }

    public void setId_customer(int id_customer) {
        this.id_customer = id_customer;
    }

    public String getDate_oder() {
        return date_oder;
    }

    public void setDate_oder(String date_oder) {
        this.date_oder = date_oder;
    }

    public String getToltal() {
        return toltal;
    }

    public void setToltal(String toltal) {
        this.toltal = toltal;
    }

    public String getPayment() {
        return payment;
    }

    public void setPayment(String payment) {
        this.payment = payment;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }
}
