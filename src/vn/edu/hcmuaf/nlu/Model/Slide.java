package vn.edu.hcmuaf.nlu.Model;

public class Slide {
    private  int id;
    private  String link;
    private  String image;

    public Slide(int id, String link, String image) {
        this.id = id;
        this.link = link;
        this.image = image;
    }

    public Slide() {

    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }
    @Override
    public String toString() {
        return "Slide{" +
                "id=" + id +
                ", link='" + link + '\'' +
                ", image='" + image + '\'' +
                '}';
    }
}
