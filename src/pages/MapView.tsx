import Layout from "@/components/Layout";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";
import { Button } from "@/components/ui/button";
import { MapPin, Filter, Layers } from "lucide-react";

export default function MapView() {
  return (
    <Layout>
      <div className="h-full flex">
        {/* Map Controls Sidebar */}
        <div className="w-80 border-r bg-card p-4">
          <div className="space-y-4">
            <Card>
              <CardHeader className="pb-3">
                <CardTitle className="text-lg flex items-center gap-2">
                  <Filter className="h-5 w-5" />
                  Filters
                </CardTitle>
              </CardHeader>
              <CardContent className="space-y-3">
                <div>
                  <label className="text-sm font-medium">Status</label>
                  <div className="flex flex-wrap gap-2 mt-1">
                    <Badge variant="status-reported" className="cursor-pointer">
                      Reported (234)
                    </Badge>
                    <Badge variant="status-progress" className="cursor-pointer">
                      In Progress (89)
                    </Badge>
                    <Badge variant="status-resolved" className="cursor-pointer">
                      Resolved (1,098)
                    </Badge>
                  </div>
                </div>
                
                <div>
                  <label className="text-sm font-medium">Category</label>
                  <div className="flex flex-wrap gap-2 mt-1">
                    <Badge variant="outline" className="cursor-pointer">Roads</Badge>
                    <Badge variant="outline" className="cursor-pointer">Lighting</Badge>
                    <Badge variant="outline" className="cursor-pointer">Water</Badge>
                    <Badge variant="outline" className="cursor-pointer">Cleanliness</Badge>
                  </div>
                </div>
                
                <div>
                  <label className="text-sm font-medium">Distance</label>
                  <div className="flex gap-2 mt-1">
                    <Button variant="outline" size="sm">1km</Button>
                    <Button variant="outline" size="sm">3km</Button>
                    <Button variant="outline" size="sm">5km</Button>
                  </div>
                </div>
              </CardContent>
            </Card>

            <Card>
              <CardHeader className="pb-3">
                <CardTitle className="text-lg flex items-center gap-2">
                  <Layers className="h-5 w-5" />
                  Map Layers
                </CardTitle>
              </CardHeader>
              <CardContent className="space-y-2">
                <div className="flex items-center justify-between">
                  <span className="text-sm">Issue Pins</span>
                  <input type="checkbox" defaultChecked className="rounded" />
                </div>
                <div className="flex items-center justify-between">
                  <span className="text-sm">Heat Map</span>
                  <input type="checkbox" className="rounded" />
                </div>
                <div className="flex items-center justify-between">
                  <span className="text-sm">Service Areas</span>
                  <input type="checkbox" className="rounded" />
                </div>
              </CardContent>
            </Card>
          </div>
        </div>

        {/* Map Container */}
        <div className="flex-1 relative">
          <div className="absolute inset-0 bg-accent/20 flex items-center justify-center">
            <div className="text-center space-y-4">
              <MapPin className="h-16 w-16 text-primary mx-auto" />
              <div>
                <h3 className="text-lg font-semibold">Interactive Map</h3>
                <p className="text-muted-foreground">
                  Live map showing all civic issues would display here
                </p>
                <p className="text-sm text-muted-foreground mt-2">
                  Integration with mapping service required for full functionality
                </p>
              </div>
            </div>
          </div>

          {/* Map Legend */}
          <div className="absolute bottom-4 left-4 bg-card p-3 rounded-lg shadow-md border">
            <h4 className="font-medium text-sm mb-2">Legend</h4>
            <div className="space-y-1 text-xs">
              <div className="flex items-center gap-2">
                <div className="w-3 h-3 rounded-full bg-primary"></div>
                <span>Reported Issues</span>
              </div>
              <div className="flex items-center gap-2">
                <div className="w-3 h-3 rounded-full bg-warning"></div>
                <span>In Progress</span>
              </div>
              <div className="flex items-center gap-2">
                <div className="w-3 h-3 rounded-full bg-success"></div>
                <span>Resolved</span>
              </div>
            </div>
          </div>
        </div>
      </div>
    </Layout>
  );
}